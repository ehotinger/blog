---
title: "Installing Hugo"
date: 2018-05-31T12:02:45-07:00
author: "Eric Hotinger"
description: "The two minute guide to setting up this website"
tags:
- dev

categories:
- dev

slug: installing-hugo
---

This is a quick-start guide to setting up Hugo with [GitHub pages](https://pages.github.com), since it took too much effort to find the full instructions anywhere else.

1. Install Hugo from the [releases page](https://github.com/spf13/hugo/releases).
2. Run `hugo new site blog` to make the skeleton of your blog website.
3. Install a theme you want. I just did `cd themes` and `git clone https://github.com/spf13/hyde`. More info about themes [here](https://gohugo.io/themes/).
4. Update the `config.toml` generated from step 2 to use the theme. I.e, add `theme = "hyde"`.
5. Make a new post using `hugo new posts/installing-hugo.md`. Edit its content to be whatever you want.
6. Run `hugo server -D` and browse to `http://localhost:1313/` to make sure the theme and content are as you expected. You can peruse the other files to edit the description of the website or refer to this website's [source code](https://github.com/ehotinger/ehotinger.github.io) to see additional options.

Other useful things:
1. [Front matter](https://gohugo.io/content-management/front-matter/)