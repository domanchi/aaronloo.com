# aaronloo.com

This repository contains the resources needed to run the static website on
https://aaronloo.com, leveraging [Github Pages](https://pages.github.com/).

All site resources are found under `/docs`, since that's the [only way that
GitHub will support nested source directories](https://help.github.com/en/articles/configuring-a-publishing-source-for-github-pages#publishing-your-github-pages-site-from-a-docs-folder-on-your-master-branch).
Furthermore, I wanted to keep my server root in a nested folder, so that Jekyll
doesn't accidentally, "magically" include files that I didn't want to be shared
on the website.

Local gems install into `vendor/gems` (gitignored). Ruby is pinned to 3.3.4
via [`mise.toml`](mise.toml) / [`.ruby-version`](.ruby-version) to match
[GitHub Pages](https://pages.github.com/versions/).

## Local Development

Install [mise](https://mise.jdx.dev/) (or another Ruby 3.3.4 toolchain), then:

```
make watch
```

The site is available at http://127.0.0.1:4000.
