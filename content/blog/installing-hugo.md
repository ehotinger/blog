---
title: "Installing Hugo"
date: 2018-05-31T12:02:45-07:00
author: "Eric Hotinger"
description: "The two minute guide to setting up this website"
tags:
- development
- software

categories:
- development
- software

slug: installing-hugo
---

This is a quick-start guide to setting up Hugo with [GitHub pages](https://pages.github.com), since it took too much effort to find the full instructions anywhere else. It should hopefully take you ~15 minutes to complete the entire thing.

1. Make two GitHub repositories, i.e., https://github.com/ehotinger/blog and https://github.com/ehotinger/ehotinger.github.io - the first repository is for the unrendered Hugo content, and the second is for the rendered content. Note: you could just have one repository as your GitHub page, but this approach allows you to easily switch off GitHub pages if you want to.

2. Install Hugo from the [releases page](https://github.com/spf13/hugo/releases).

3. Run `hugo new site blog` to make the skeleton of your blog website.

4. Install a theme you want. I chose `hyde` initially and just did `cd themes` and `git clone https://github.com/spf13/hyde`. More info about themes [here](https://gohugo.io/themes/).

5. Update the `config.toml` generated from step 2 to use the theme. I.e, add `theme = "hyde"` to the toml.

6. Make a new post using `hugo new posts/installing-hugo.md` or something simimlar. Edit its content to be whatever you want.

7. Run `hugo server -D` and browse to `http://localhost:1313/` to make sure the theme and content are as you expected. You can peruse the other files to edit the description of the website or refer to this website's [source code](https://github.com/ehotinger/blog) to see additional options. See also the "front matter" link at the bottom of this post.

8. Now add a `git remote` for the `blog` repository that you made in step 1. `git remote add origin https://github.com/ehotinger/blog`. You can then do a `git fetch origin` and `git merge origin/master`. Make sure you have `public` folder with a `rm -rf public/` and then you're free to `git push -u origin master`.

9. Link the two repos you made in step one together. I made a simple git submodule that links Hugo's `public` subfolder to the second repository you made in the first step. I.e., `git submodule add -b master https://github.com/ehotinger/ehotinger.github.io.git public`.

10. Finally, it's time to deploy. A simple bash script like the following is all you need:

```sh
hugo -t hyde
cd public
git add .

msg="Automatically rebuilt - `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

git commit -m "$msg"
git push origin master
cd ..
```

Straightforward to read, but this will just make a commit automatically on your behalf for the 2nd repository you made.
You can now commit freely to your unrendered blog website as well as your GitHub pages.

Other useful things:

1. [Hugo front matter](https://gohugo.io/content-management/front-matter/) - a list of all the metadata you can put on individual content. Description, tags, title, etc.