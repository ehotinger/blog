---
title: "Windows Subsystem for Linux Installation"
date: 2021-08-14T12:14:50-07:00
draft: false
tags:
- dev
- windows

categories:
- dev
- windows

slug: windows-subsystem-for-linux-installation
---

A few common problems that I hit when installing WSL. This is my personal mini guide to get it up and running in a few minutes.

First, you can visit https://docs.microsoft.com/en-us/windows/wsl/install-win10#simplified-installation-for-windows-insiders to get a beta build and run the commands to install WSL.

WSL can fail on a new machine even after this because it relies on virtualization:

- Enable Hyper-V (Turn Windows features on or off -> Hyper-V)
- Enable virtualization in the BIOS (go to your CPU Config and you'll find it)

Bonus oddities:
- WSL2: Virtual hard disk files must be uncompressed and unencrypted and must not be sparse [#4103](https://github.com/microsoft/WSL/issues/4103)
    - Go to `%USERPROFILE%\AppData\Local\Packages\` and look for something like `CanonicalGroup`, right click on "LocalState", Properties, Advanced, deselect "Compress contents"