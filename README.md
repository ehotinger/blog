# Eric Hotinger's Blog

This is the source code for my blog, which is hosted at: https://ehotinger.com/

These are the markdown files that use Hugo, and the rendered version is at: https://github.com/ehotinger/ehotinger.github.io

Check out these blog posts for how the architecture works end-to-end. The only thing that I pay for is the DNS, and the rest is free!
- https://ehotinger.com/blog/github-pages-aws-ssl/
- https://ehotinger.com/blog/making-a-github-pages-hugo-blog/

## Installing

- `git clone git@github.com:ehotinger/blog.git --recursive`
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

## Installing Compatible Hugo
```sh
➜  hugo version
hugo v0.121.1-00b46fed8e47f7bb0a85d7cfc2d9f1356379b740 darwin/arm64 BuildDate=2023-12-08T08:47:45Z VendorInfo=gohugoio
```

Download from: https://github.com/gohugoio/hugo/releases/tag/v0.121.1

```sh
➜ type hugo
hugo is /opt/homebrew/bin/hugo
```

- `xattr -d com.apple.quarantine /opt/homebrew/bin/hugo` - Unquarantine after moving here if needed.