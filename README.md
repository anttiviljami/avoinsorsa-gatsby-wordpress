# Avoinsorsa.fi Gatsby/WordPress

A Gatsby static site using free WordPress on Heroku as headless CMS

## Local Development

Install [Docker](https://www.docker.com/)

Install [Node.js](https://nodejs.org/en/download/)

Install [AWS-CLI](https://aws.amazon.com/cli/)

Install [Heroku-CLI](https://devcenter.heroku.com/articles/heroku-cli)

Clone this repo and source set up your environment inside the project root.

```bash
cp .env.sample .env
source .env
```

I also recommend installing [autoenv](https://github.com/kennethreitz/autoenv),
so you don't have to run the source command all the time.

```bash
npm install
```

Start a shell inside Docker. It might take a moment for the images to download
and build. This is normal.

```bash
npm run shell
```

Now you can run `composer install` inside Docker

```bash
composer install && exit
```

Outside the docker shell, you can now start development

```bash
npm run dev
```

You can now navigate to [`http://localhost:8080/wp-admin`](http://localhost:8080/wp-admin) to
start working with your local WordPress installation.

Or view the gatsby site at [`http://localhost:8000`](http://localhost:8000)

