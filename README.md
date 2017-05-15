# WP Heroku Docker Project
[![Build Status](https://travis-ci.org/anttiviljami/wordpress-heroku-docker-project.svg?branch=master)](https://travis-ci.org/anttiviljami/wordpress-heroku-docker-project) [![License](http://img.shields.io/:license-gpl3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0.html)

The Holy Grail WordPress project template for Heroku deployment and local Docker development.

## Features

- [x] Bedrock-like modern development environment
- [x] Deployment to Heroku pipelines
- [x] Local Heroku-like environment with Docker-compose
- [x] PHP 7
- [x] WP-CLI
- [x] Configurable Nginx
- [x] Redis Object Cache
- [x] Travis CI pipeline you can run with Docker
- [x] PHP Codesniffer with nicer coding standards for WordPress
- [x] Media Uploads to S3
- [x] Newrelic APM monitoring
- [x] Papertrail log management
- [x] Environment management for complete `local`, `development`, `qa` and `production` pipeline
- [x] [CloudFormation script](https://github.com/anttiviljami/wordpress-heroku-docker-project/blob/master/tools/mariadb-cloudformation.json)
for provisioning a MariaDB database on AWS RDS
- [ ] Scripts for automating deployment, synchronising databases
- [ ] Basic integration tests

## Local Development

Install [Docker](https://www.docker.com/)

Clone this repo and source set up your environment inside the project root.

```bash
cp .env.sample .env
source .env
```

I also recommend installing [autoenv](https://github.com/kennethreitz/autoenv),
so you don't have to run the source command all the time.

Start a shell inside Docker. It might take a moment for the images to download
and build. This is normal.

```bash
docker-compose run shell
```

Now you can run `composer install` inside Docker

```bash
composer install
```

If you want, you can now install WordPress with `tools/install-wordpress.sh`
```bash
$ ./tools/install-wordpress.sh
2/6 --title=<site-title>: My WordPress Site
Success: WordPress installed successfully.
Plugin 's3-uploads' activated.
Success: Activated 1 of 1 plugins.
Success: The cache was flushed.
----> WordPress installed succesfully!
```

Outside the docker shell, you can now start the main process

```bash
docker-compose up web
```

You can now navigate to [`http://localhost:8080`](http://localhost:8080) to
start working with your local WordPress installation.

## WP-CLI

You can run WP-CLI locally by starting the shell container

```
docker-compose run shell
```

To run wp-cli in a Heroku instance, just run a temporary bash dyno.

```
heroku run bash
```

Both environments have WP-CLI available as `wp`.

## Running tests

Travis will run the `ci` container to test your app. You can do the same
locally!

```
docker-compose up ci
```

## Deployment to Heroku

Set up a new app on Heroku.

You need to provide a `DATABASE_URL` config variable containing a URL to a
working MySQL database.

You can use the included
[CloudFormation script](https://github.com/anttiviljami/wordpress-heroku-docker-project/blob/master/tools/mariadb-cloudformation.json)
to provision a MariaDB instance on AWS, or alternatively you can enable the free
ClearDB Heroku addon and copy the content of `CLEARDB_DATABASE_URL` to your
`DATABASE_URL` Heroku config.

I strongly recommend enabling at least the following addons for your Heroku app:

- Papertrail
- Redis
- NewRelic APM

Make sure you set up S3 uploads and set your `WP_ENV` variable for Heroku

```bash
heroku config:set \
  WP_ENV=development \
  S3_UPLOADS_BUCKET=my-bucket \
  S3_UPLOADS_KEY=<replace> \
  S3_UPLOADS_SECRET=<replace> \
  S3_UPLOADS_REGION=eu-central-1
```

You can now push to Heroku! Here's an example of a WordPress instance running
on Heroku:

[wp-project-dev.herokuapp.com](https://wp-project-dev.herokuapp.com/)

This is how your project should look like on Heroku:

![Heroku App Dashboard](https://cloud.githubusercontent.com/assets/6105650/26044996/9fbb346c-3950-11e7-82cc-2524215a3d8a.png)

![Heroku Pipeline](https://cloud.githubusercontent.com/assets/6105650/26045817/91526a9a-3954-11e7-8756-ba7cf5a5405c.png)
