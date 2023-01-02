# blog

This is the source code for my blog. See also: https://github.com/ehotinger/ehotinger.github.io

## Installing

- `git clone https://github.com/ehotinger/blog --recursive`
- `snap install hugo` (Linux) or `brew install hugo` (Mac) or `sudo apt install hugo` (WSL)

## Submodules

- `git clone https://github.com/nishanths/cocoa-hugo-theme.git themes/cocoa`
- `git submodule add -b master https://github.com/ehotinger/ehotinger.github.io.git public` to link the submodule if using a non-recursive clone.

## Publishing

- `hugo new blog/article.md`
- `hugo -t cocoa`
- `hugo server -D` -> browse to `localhost:1313` to verify it looks okay

## Deploying

- `sudo bash deploy.sh` (Mac)
- `./deploy.sh` (WSL)
