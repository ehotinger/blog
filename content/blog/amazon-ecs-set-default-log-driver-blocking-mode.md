---
title: "Amazon ECS Set Default Log Driver Blocking Mode"
date: 2025-04-18T10:06:17-07:00
draft: false

tags:
- development
- software
- availability

categories:
- development
- software
- availability

description: "Learn how Amazon ECS's new defaultLogDriverMode feature enhances container reliability by setting non-blocking log drivers at the account level, preventing application failures during logging backpressure events."
---

# Amazon ECS Set Default Log Driver Blocking Mode

As of April 17th, 2025 in Amazon Elastic Container Service (ECS), you can set the `defaultLogDriverMode` for your tasks at an account level using the [PutAccountSettingDefault API](https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutAccountSettingDefault.html).

## What is the problem with logs?

Docker has a logging daemon implementation which will read STDOUT and STDERR of a container and convert logs into an in-memory ring buffer (see [code here](https://github.com/moby/moby/blob/master/daemon/logger/ring.go)). Those messages get sent to a log driver, such as the [AWS log driver](https://github.com/moby/moby/blob/master/daemon/logger/awslogs/cloudwatchlogs.go), which can then upload them to a service such as CloudWatch.

The default logging mode for Docker is blocking, which means that if the log driver cannot process logs to a service correctly, it does not allow for lossiness and can start blocking during logging events. You can take precautions against this by configuring the maximum size of the ring buffer and enable logs to drop in a lossy manner (i.e., the first record in the ring) in cases of significant backpressure.

More specifically, check out these parameters for Docker's log driver:

```
'mode': 'non-blocking'
'max-buffer-size': '16m'
```

Backpressure will occur if you can't write logs and the buffer starts to overflow. For example, maybe the service that you're trying to write to goes down and the buffer can't flush. This means if your application has the driver set to be blocking, then your application itself will break during any logs. In many services, it is better to accept lossiness for logs and allow your application to continue processing.

## Why is this important?

Previously, you had to specify the default logging driver across all your tasks individually to ensure they were configured correctly. This could be extremely error-prone in a large organization. Now, since AWS allows you to define this setting across your entire account, you can ensure that all your tasks have safe defaults based on your service requirements.

## Related Posts
- Check out my related post about [Operating your Service in Grey Modes](https://ehotinger.com/blog/operating-in-grey-modes/).
- AWS What's New: https://aws.amazon.com/about-aws/whats-new/2025/04/amazon-ecs-set-default-log-driver-blocking-mode/