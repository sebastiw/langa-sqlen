FROM postgres:11.4-alpine

ENV POSTGRES_PASSWORD="postgres"
ENV POSTGRES_USER="postgres"
ENV POSTGRES_DB="langasql_dev"

EXPOSE 5432:5432
