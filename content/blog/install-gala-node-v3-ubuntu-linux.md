---
title: "Install Gala Node V3 on Ubuntu Linux"
date: 2023-01-29T15:01:03-08:00
draft: false
author: "Eric Hotinger"

description: "Setting up a Gala Node V3 on Ubuntu Linux for AWS"
tags:
- development
- software

categories:
- development
- software

---

These are the all scripts required to install [Gala Games](https://app.gala.games/) v3 nodes. It's a trimmed down version of the [main blog post](https://support.gala.games/posts/4612481-install-the-gala-node-software-on-ubuntu-linux).


## Install Docker
1. `sudo apt install docker.io -y`
2. `sudo systemctl status docker`
3. `sudo systemctl enable --now docker`

## Install the Gala Image
1. `sudo wget --trust-server-names https://links.gala.com/DownloadLinuxNode`
    - It downloads a file name called gala-node-vX.X.X.tar.gz.
2. `sudo tar xzvf gala-node-v3[version number].tar.gz`
3. `sudo ./gala-node/install.sh`
4. sudo gala-node config api-key your API key here
5. Run `sudo gala-node licenses`
6. Based on your licenses use `sudo gala-node config workloads <workload>` For example `sudo gala-node config workloads founders`
7. `sudo gala-node start`
8. Verify it's up: `sudo gala-node status`

Optional step:
- Run `sudo gala-node rename <node_name>` so you can easily identify it on the dashboard.