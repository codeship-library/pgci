# `codeship/pgci`: PostgreSQL Image Tuned for Continuous Integration

![https://codeship.com/projects/d7b52d20-662b-0133-0e16-72bdfd530753/status?branch=master](https://codeship.com/projects/d7b52d20-662b-0133-0e16-72bdfd530753/status?branch=master)

This is a PostgreSQL Docker Image tuned for CI. That means it's blazing fast with simple credentials but
the data is not very durable, so don't use it in production!

## Usage

When you run it, it will listen on PostgreSQL's default port, and you can log in with user `postgres` and password `password`.
