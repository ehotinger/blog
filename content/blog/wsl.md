---
title: "Windows Subsystem for Linux Installation"
date: 2021-08-14T12:14:50-07:00
draft: false
author: "Eric Hotinger"

description: "Discover the solution to common problems faced during the installation of Windows Subsystem for Linux (WSL) in this comprehensive guide. Follow the steps outlined in this mini guide to get WSL up and running on your machine in just a few minutes. From visiting the Microsoft website to downloading the beta build and running the necessary commands, this guide covers all the necessary steps to ensure a successful installation. In addition, this guide also provides tips to troubleshoot any issues that may arise due to WSL's reliance on virtualization. Get tips on enabling Hyper-V, virtualization in the BIOS, and handling the bonus oddities of WSL2. Don't miss out on the important information regarding Virtual hard disk files, and how to uncompress and unencrypt them to resolve issues. Get started now and enjoy the seamless integration of Linux with Windows."

tags:
- development
- windows
- software

categories:
- development
- windows
- software


slug: windows-subsystem-for-linux-installation
---

Here are a few common problems that I hit when installing WSL. This is my personal mini guide to get it up and running in a few minutes.

First, you can visit https://docs.microsoft.com/en-us/windows/wsl/install-win10#simplified-installation-for-windows-insiders to get a beta build and run the commands to install WSL.

WSL can fail on a new machine even after this because it relies on virtualization:

- Enable Hyper-V (Turn Windows features on or off -> Hyper-V)
- Enable virtualization in the BIOS (go to your CPU Config and you'll find it)

Bonus oddities:
- WSL2: Virtual hard disk files must be uncompressed and unencrypted and must not be sparse [#4103](https://github.com/microsoft/WSL/issues/4103)
    - Go to `%USERPROFILE%\AppData\Local\Packages\` and look for something like `CanonicalGroup`, right click on "LocalState", Properties, Advanced, deselect "Compress contents"