# TEMPLATE FOR HTML+CSS+JS WEBSITE

This is a minimal template for a basic website.

## Features

* Bundling using parcel. [More about parcel](https://parceljs.org/)
* Makefile for building, deploying into Github Pages and sending the built site to a server

## Prerequisites

* You need to have the parcel bundler installed.

## Instructions

After cloning this, create a gh-pages branch in github and enable Github Pages in the repository settings.

You need to edit the SITE_NAME variable in the makefile.

For building the website

```
make build
```

This will create a hidden folder `.dist`. Use this when you need to fix bundling issues.

For testing, benchmarking locally, use local option

```
make local
```

This will build and serve the site in https://localhost:1234

To deploy your site to github pages, first commit everything. Then 

```
make preview
```

This will ask you type in the commit message for the new deployment

If you have a server, use the deploy option. You need to pass the username and server_address. This is written assuming you are using ssh-keys. If you are using passwords , please don't.

```
make deploy USERNAME=myname SERVER_ADDRESS=127.0.0.1
```

This will create a tar file name site-{your-site-name}.tar.gz.



