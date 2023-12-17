# Use an official ClickHouse image as the base image
FROM clickhouse/clickhouse-server:23-alpine

# Copy your SQL script to create the database and table
COPY /clickhouse/init.sql /docker-entrypoint-initdb.d/
