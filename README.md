## Docker-showoff

A docker image for running showoff

In case you didn't want to keep a ruby around


## Quickstart

```shell
docker pull nibalizer/docker-showoff
docker run -it --rm  -p 9090:9090 --mount type=bind,source="$(pwd)",target=/srv/showoff  nibalizer/docker-showoff serve
```

Open web browser to ``http://localhost:9090``

Replace 'serve' above with 'help' to explore showoff functionality.


## Publishing to GitHub Pages

If you would like to have a backup link to your presentation and not rely on
serving your presentation locally from your laptop, you can easily publish your
showoff presentation to GitHub Pages. Follow these steps once you have a version
of your presentation that your are happy with:

* Create a branch called `gh-pages` off of `master`:

```shell
git checkout -b gh-pages
```

* Push your local `gh-pages` branch to a remote branch on GitHub:

```shell
git push origin gh-pages
```

That's it. A static version of your presentation is now viewable at
`https://YOUR_GITHUB_USERNAME.github.io/YOUR_PRESENTATION_REPO_NAME`. Note that
if you have a custom domain set up, that will be used instead of the default
github.io domain.
