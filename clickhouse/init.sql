-- Create a database
CREATE DATABASE IF NOT EXISTS logs;

-- Use the database
USE logs;

-- Create the table
create table docker_logs(container_created_at DateTime64,
    container_id String,
    container_name String,
    host String,
    image String,
    label String,
    message String,
    source_type String,
    stream String,
    timestamp DateTime64)
ENGINE = MergeTree()
PARTITION BY toYYYYMM(timestamp)
ORDER BY timestamp
TTL toDateTime(timestamp) + INTERVAL 90 DAY;
