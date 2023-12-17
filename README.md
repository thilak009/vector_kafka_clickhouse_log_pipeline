### Log Pipeline using vector, kafka, clickhouse
TODO: add desciription of how things work

#### Steps to run
1. `docker compose up -d`, this will start the followin containers
    - kafka (we will send logs via kafka instead of directly to clickhouse)
    - zookeeper
    - init-kafka (used to create a topic once kafka starts)
    - clickhouse (storage for logs)
    - vector (to scrape docker logs)
    - kafka-ui (https://docs.kafka-ui.provectus.io/overview/readme) (to work with kafka via GUI, for creating topics and seeing messages etc..)
    - grafana (for visualisation of lgos)
    - nginx (the container where we will get logs from)
2. Install clickhouse plugin in grafana
    - Exec into the grafana container and run the following command `grafana cli plugins install grafana-clickhouse-datasource`
    - restart the grafana container so that the plugin is loaded
3. Configure clickhouse data source on grafana: https://clickhouse.com/docs/en/integrations/grafana
4. Create a [panel of type logs](https://grafana.com/docs/grafana/latest/panels-visualizations/visualizations/logs/) with the clickhouse data source and use the query `select *from logs.docker_logs limit 100`, if you have specified a default database while configuring the data soruce then just use the table name
5. Visit `localhost:8081` (nginx server) to generate logs in nginx which should be available in grafana