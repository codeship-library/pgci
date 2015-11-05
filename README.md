# `codeship/pgci`: PostgreSQL Image Tuned for Continuous Integration

This is a PostgreSQL Docker Image tuned for CI. That means it's blazing fast with simple credentials but
the data is not very durable, so don't use it in production!

## Usage

When you run it, it will listen on PostgreSQL's default port, and you can log in with user `codeship` and password `password`.
