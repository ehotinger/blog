---
title: "Azure Container Registry Tasks Daily Autopurge"
date: 2019-07-16T14:15:54-07:00
draft: false
tags:
- acr

categories:
- dev

slug: acr-tasks-daily-autopurge
---


[Azure Container Registry Tasks](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-tasks-overview) came out with a *lot* of new features in the last year. Many people don't realize the insane potential of this service, so I wanted to share a few things that you probably didn't know and some of the things the team has been working on.

In particular, I wanted to use [one of the most common feature requests](https://github.com/Azure/acr/issues/82) of the Azure Container Registry - automatic garbage collection of old or unused tags/manifests/images - as an example of how you can make the world your oyster using ACR Tasks.


## Creating a multi-step Task

ACR Tasks can be used to build and run containers to create complex workflows. Tasks are broken up by [multiple steps](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-tasks-multi-step) and a build is just a single-step Task (if pushing to the registry is enabled, it becomes a two-step Task). The runtime is able to share context between containers, run them sequentially, in parallel, as background jobs, and much more. This means that you can use ACR Tasks as a way to run arbitrary containers and therefore run *any arbitrary code as workflows expressed as a directed acyclic graph*.

I have some examples of yaml files that do different things in a [scratch repository](https://github.com/ehotinger/scratch) on GitHub.

For example, this one builds a container image, starts an nginx web server, pings it, and if the ping succeeds, pushes the image to a registry. You could imagine running unit tests, integration tests, etc. and taking actions if they fail or succeed.

```yaml
steps:
- build: -t {{.Run.Registry}}/scratchy .
- id: app
  cmd: nginx:alpine
  ports: 
    - 80:80
  detach: true
- cmd: byrnedo/alpine-curl --url http://app:80
- push: [{{.Run.Registry}}/scratchy]
```

As another example, here's a simpler Task that allows you to run bash before you build a container and another once it's finished:

```yaml
steps:
  - cmd: bash ./pre.sh
  - build: -f Dockerfile .
  - cmd: bash ./post.sh
```

## Context

Docker and ACR use the concept of "context" to describe where the files you use in a build or run (in the case of ACR) come from. For example, they could be a tarball over HTTP, a git server, or local files. In the case of ACR, we only deal with tar and git since you can't have local files on the cloud. This means when you run something like [az acr build .](https://docs.microsoft.com/en-us/cli/azure/acr?view=azure-cli-latest#az-acr-build) or [az acr run .](https://docs.microsoft.com/en-us/cli/azure/acr?view=azure-cli-latest#az-acr-run) in the Azure command line, the command line packages all of your local files into a tar, uploads it to Azure Blob, and sends that as the context to the registry to use for a Task.

We also implemented a new way to provide context: encoded files. This means that you can run steps without having any files at all.

You specify the "null" or non-existent context in the Azure CLI by using `/dev/null` as the context.

For example, you can run the following command to run the `hello-world` Docker image without uploading any context to the registry:

```sh
$ az acr run /dev/null --cmd "hello-world" -r <registry>
```

## Autopurge

The concept of autopurge is pretty simple: people regularly push "stuff" to the registry and eventually it's unused. Nobody wants to spend money on unused data and it takes away from the registry's capacity. [Gildardo](https://github.com/ggonzalere) has been working on a CLI (you can find it [here](https://github.com/Azure/acr-cli) on GitHub) which allows you to purge artifacts from your registry. It's still a WIP, so feel free to create feature requests and/or create bugs!

As an example, you can use this command to delete manifests which don't have any tags referencing it ("dangling manifests"):

```sh
acr purge --registry <Registry Name> --repository <Repository Name> --dangling
```

## Nightly Tasks

[Jeanine](https://github.com/jaysterp) has been diligently working on [scheduled tasks](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-tasks-scheduled) and it was released just a few days ago. It allows you to create cron jobs out of your containers. I.e., now you can create a nightly build, run some data processing once a week, etc. as a first-class experience.

## Putting it all together

Now that I have all of these components, I can put together an autopurge job that runs every day to clean up my Azure Container Registry.

Since the `purge` CLI hasn't been first-classed yet in Tasks, I built the image and pushed it to my own registry. All you have to do is go to [acr-cli repo](https://github.com/Azure/acr-cli) and follow the README to build the image (`docker build -t foo.azurecr.io/acr:latest .`).

Now I can create a Task that references the image that I pushed and run it on a schedule:

```sh
az acr task create --name purgetask --registry ehotinger --context /dev/null --cmd "{{.Run.Registry}}/acr purge --repository "scratch" --ago 10d -r {{.Run.Registry}}" --schedule "0 10 * * *"
```

This creates a Task called `purgetask` against the `ehotinger` Azure Container Registry, without any files required (`/dev/null` context). It runs the `ehotinger/acr` image and the `purge` subcommand against the `scratch` repository, which will delete any tags older than 10 days. The schedule is set to run every day at 10 UTC.

## Conclusion

I hope this gives you a few more ideas about ways you can interact with the Azure Container Registry and ACR Tasks. Post any issues, feature requests, bugs, etc. on the relevant GitHub repositories. They're carefully monitored and the team loves feedback.