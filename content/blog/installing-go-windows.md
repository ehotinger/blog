---
title: "Installing Go on Windows (including Make)"
date: 2018-07-07T00:00:00-07:00
author: "Eric Hotinger"
description: "Get your Go environment set up on Windows easily with this brief guide! Discover the simplest way to get your Makefiles working cross-platform by changing shells. Follow the steps outlined in this guide to avoid CREATE PROCESS(NULL, ... errors. Learn how to install Go using the default installer and add the Make for Windows and Cygwin installations to your $PATH. Finally, find out how to run your Makefiles from Cygwin, without any hassle. Start setting up Go on Windows today!"

tags:
- development
- Go
- software

categories:
- development
- software

slug: installing-go-windows
---

This is an extremely brief guide to setting up Go on Windows. There are plenty of guides out there for setting up Go, but none that also include how to get your `Makefile`s working cross-platform easily. The easiest way I've found to do this is to change shells. This is especially true if you have Makefiles like I do, where `$(shell)` is everywhere. With the default shell you'll end up with `CREATE PROCESS(NULL, ...` errors everywhere because functionality is missing.

1. The [default installer](https://golang.org/doc/install) on Windows works great for Go now. It'll set up `$GOPATH` to be `%USERPROFILE\go` and `$GOROOT` to be `C:\go`. It'll also modify your `$PATH` to be `C:\go\bin`.

2. Download [Make for Windows](http://gnuwin32.sourceforge.net/packages/make.htm). Add the installation path to your `$PATH`.

3. Download [Cygwin](https://cygwin.com/install.html).

4. From Cygwin, `cd C:/users/blah/go/src/github.com/blah/somerepo`, and from there you should be able to run `make`.