# hugo-docker
Hugo in Docker

## Build your website

I assume your entire Hugo content is in a folder called `dev/`

```shell
export BASEURL="https://zrezai-dev.de/"

docker run -it --rm -v $(pwd)/dev:/tmp xcalizorz/hugo:1.0-alpine \
  hugo --minify \
  --baseUrl ${BASEURL} \
  --destination public

                   | DE
-------------------+-----
  Pages            | 74
  Paginator pages  |  3
  Non-page files   |  0
  Static files     | 43
  Processed images |  0
  Aliases          | 30
  Sitemaps         |  1  
  Cleaned          |  0
```

Now the new files are stored at `dev/public/`, you can upload them to your server and enjoy. :)