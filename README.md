# kafka-docker-playground-connect ![CI](https://github.com/vdesabou/kafka-docker-playground-connect/workflows/CI/badge.svg?branch=master)

Create Kafka Connect image with Confluent Hub connectors required for [vdesabou/kafka-docker-playground](https://github.com/vdesabou/kafka-docker-playground) repository

| connector  | version | license | owner | release date | documentation |
|---|---|---|---|---|---|
| confluentinc-connect-transforms | 1.4.1 | Confluent Software License | Confluent, Inc. | 2021-09-10 | [documentation](https://docs.confluent.io/current/connect/transforms/index.html) |
| confluentinc-kafka-connect-activemq | 11.0.8 | Confluent Software Evaluation License | Confluent, Inc. | 2021-08-10 | [documentation](https://docs.confluent.io/kafka-connect-activemq-source/current/index.html) |
| confluentinc-kafka-connect-activemq-sink | 1.4.1 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-01 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-activemq/sink) |
| confluentinc-kafka-connect-amps | 1.0.0-preview | Confluent Software Evaluation License | Confluent, Inc. | 2020-07-08 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-amps/) |
| confluentinc-kafka-connect-appdynamics-metrics | 1.1.6 | Confluent Software Evaluation License | Confluent, Inc. | 2021-08-12 | [documentation](https://docs.confluent.io/kafka-connect-appdynamics-metrics/current/index.html) |
| confluentinc-kafka-connect-aws-cloudwatch-logs | 1.2.1 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-09 | [documentation](https://docs.confluent.io/kafka-connect-aws-cloudwatch-logs/current/index.html) |
| confluentinc-kafka-connect-aws-cloudwatch-metrics | 1.1.6 | Confluent Software Evaluation License | Confluent, Inc. | 2021-08-12 | [documentation](https://docs.confluent.io/kafka-connect-aws-cloudwatch-metrics/current/index.html) |
| confluentinc-kafka-connect-aws-dynamodb | 1.2.0 | Confluent Software Evaluation License | Confluent, Inc. | 2021-04-20 | [documentation](https://docs.confluent.io/kafka-connect-aws-dynamodb/current/index.html) |
| confluentinc-kafka-connect-aws-lambda | 1.1.1 | Confluent Software Evaluation License | Confluent, Inc. | 2021-01-07 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-aws-lambda/) |
| confluentinc-kafka-connect-aws-redshift | 1.1.0 | Confluent Software Evaluation License | Confluent, Inc. | 2021-04-23 | [documentation](https://docs.confluent.io/kafka-connect-aws-redshift/current/index.html) |
| confluentinc-kafka-connect-azure-blob-storage | 1.6.3 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-13 | [documentation](https://docs.confluent.io/kafka-connect-azure-blob-storage-sink/current/index.html) |
| confluentinc-kafka-connect-azure-blob-storage-source | 1.4.7 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-10 | [documentation](https://docs.confluent.io/kafka-connect-azure-blob-storage-source/current/index.html) |
| confluentinc-kafka-connect-azure-data-lake-gen1-storage | 1.6.3 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-13 | [documentation](https://docs.confluent.io/kafka-connect-azure-data-lake-gen1-sink/current/index.html) |
| confluentinc-kafka-connect-azure-data-lake-gen2-storage | 1.6.3 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-13 | [documentation](https://docs.confluent.io/kafka-connect-azure-data-lake-gen2-sink/current/index.html) |
| confluentinc-kafka-connect-azure-event-hubs | 1.2.1 | Confluent Software Evaluation License | Confluent, Inc. | 2021-07-26 | [documentation](https://docs.confluent.io/kafka-connect-azure-event-hubs/current/index.html) |
| confluentinc-kafka-connect-azure-functions | 1.0.12 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-09 | [documentation](https://docs.confluent.io/kafka-connect-azure-functions/current/index.html) |
| confluentinc-kafka-connect-azure-search | 1.1.1 | Confluent Software Evaluation License | Confluent, Inc. | 2021-08-16 | [documentation](https://docs.confluent.io/kafka-connect-azure-search/current/index.html) |
| confluentinc-kafka-connect-azure-service-bus | 1.2.2 | Confluent Software Evaluation License | Confluent, Inc. | 2021-08-09 | [documentation](https://docs.confluent.io/kafka-connect-azure-servicebus/current/index.html) |
| confluentinc-kafka-connect-azure-sql-dw | 1.0.4 | Confluent Software Evaluation License | Confluent, Inc. | 2020-10-08 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-azure-sql-dw/) |
| confluentinc-kafka-connect-cassandra | 2.0.0 | Confluent Software Evaluation License | Confluent, Inc. | 2020-12-04 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-cassandra/) |
| confluentinc-kafka-connect-data-diode | 1.1.1 | Confluent Software Evaluation License | Confluent, Inc. | 2019-10-18 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-data-diode/) |
| confluentinc-kafka-connect-datadog-metrics | 1.1.6 | Confluent Software Evaluation License | Confluent, Inc. | 2021-08-12 | [documentation](https://docs.confluent.io/kafka-connect-datadog-metrics/current/index.html) |
| confluentinc-kafka-connect-datagen | 0.5.0 | Apache License 2.0 | Confluent, Inc. | 2021-05-20 | [documentation](https://github.com/confluentinc/kafka-connect-datagen/blob/master/README.md) |
| confluentinc-kafka-connect-elasticsearch | 11.1.2 | Confluent Community License | Confluent, Inc. | 2021-09-11 | [documentation](https://docs.confluent.io/kafka-connect-elasticsearch/current/index.html) |
| confluentinc-kafka-connect-firebase | 1.2.0 | Confluent Software Evaluation License | Confluent, Inc. | 2020-12-01 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-firebase/) |
| confluentinc-kafka-connect-ftps | 1.0.3-preview | Confluent Software Evaluation License | Confluent, Inc. | 2020-10-01 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-ftps/) |
| confluentinc-kafka-connect-gcp-bigtable | 1.0.10 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-14 | [documentation](https://docs.confluent.io/kafka-connect-gcp-bigtable/current/index.html) |
| confluentinc-kafka-connect-gcp-dataproc-sink | 1.1.2 | Confluent Software Evaluation License | Confluent, Inc. | 2021-07-13 | [documentation](https://docs.confluent.io/kafka-connect-gcp-dataproc/current/index.html) |
| confluentinc-kafka-connect-gcp-functions | 1.1.5 | Confluent Software Evaluation License | Confluent, Inc. | 2021-05-15 | [documentation](https://docs.confluent.io/kafka-connect-gcp-functions/current/index.html) |
| confluentinc-kafka-connect-gcp-pubsub | 1.1.0 | Confluent Software Evaluation License | Confluent, Inc. | 2021-07-22 | [documentation](https://docs.confluent.io/kafka-connect-gcp-pubsub/current/index.html) |
| confluentinc-kafka-connect-gcp-spanner | 1.0.7 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-16 | [documentation](https://docs.confluent.io/kafka-connect-gcp-spanner/current/index.html) |
| confluentinc-kafka-connect-gcs | 5.5.8 | Confluent Software Evaluation License | Confluent, Inc. | 2021-08-05 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-gcs/index.html) |
| confluentinc-kafka-connect-gcs-source | 1.4.7 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-10 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-gcs-source/) |
| confluentinc-kafka-connect-github | 2.1.1 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-07 | [documentation](https://docs.confluent.io/kafka-connect-github/current/index.html) |
| confluentinc-kafka-connect-hbase | 1.0.10 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-14 | [documentation](https://docs.confluent.io/kafka-connect-hbase/current/index.html) |
| confluentinc-kafka-connect-hdfs | 10.1.1 | Confluent Community License | Confluent, Inc. | 2021-08-05 | [documentation](https://docs.confluent.io/kafka-connect-hdfs/current/index.html) |
| confluentinc-kafka-connect-hdfs2-source | 1.4.7 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-10 | [documentation](https://docs.confluent.io/kafka-connect-hdfs2-source/current/index.html) |
| confluentinc-kafka-connect-hdfs3 | 1.1.4 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-08 | [documentation](https://docs.confluent.io/kafka-connect-hdfs3-sink/current/index.html) |
| confluentinc-kafka-connect-hdfs3-source | 1.4.7 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-10 | [documentation](https://docs.confluent.io/kafka-connect-hdfs3-source/current/index.html) |
| confluentinc-kafka-connect-http | 1.5.0 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-10 | [documentation](https://docs.confluent.io/kafka-connect-http/current/index.html) |
| confluentinc-kafka-connect-ibmmq | 11.0.8 | Confluent Software Evaluation License | Confluent, Inc. | 2021-08-10 | [documentation](https://docs.confluent.io/kafka-connect-ibmmq-source/current/) |
| confluentinc-kafka-connect-ibmmq-sink | 1.4.1 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-01 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-ibmmq/sink) |
| confluentinc-kafka-connect-influxdb | 1.2.2 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-02 | [documentation](https://docs.confluent.io/kafka-connect-influxdb/current/index.html) |
| confluentinc-kafka-connect-jdbc | 10.2.3 | Confluent Community License | Confluent, Inc. | 2021-09-21 | [documentation](https://docs.confluent.io/kafka-connect-jdbc/current/) |
| confluentinc-kafka-connect-jira | 1.0.5-preview | Confluent Software Evaluation License | Confluent, Inc. | 2021-05-27 | [documentation](https://docs.confluent.io/kafka-connect-jira/current/index.html) |
| confluentinc-kafka-connect-jms | 11.0.8 | Confluent Software Evaluation License | Confluent, Inc. | 2021-08-10 | [documentation](https://docs.confluent.io/kafka-connect-jms-source/current/index.html) |
| confluentinc-kafka-connect-jms-sink | 1.4.1 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-01 | [documentation](https://docs.confluent.io/kafka-connect-jms-sink/current/index.html) |
| confluentinc-kafka-connect-kinesis | 1.3.7 | Confluent Software Evaluation License | Confluent, Inc. | 2021-05-07 | [documentation](https://docs.confluent.io/kafka-connect-kinesis/current/index.html) |
| confluentinc-kafka-connect-kudu | 1.0.2 | Confluent Software Evaluation License | Confluent, Inc. | 2021-03-12 | [documentation](https://docs.confluent.io/kafka-connect-kudu/current/index.html) |
| confluentinc-kafka-connect-maprdb | 1.1.3 | Confluent Software Evaluation License | Confluent, Inc | 2021-03-11 | [documentation](https://docs.confluent.io/kafka-connect-maprdb/current/index.html) |
| confluentinc-kafka-connect-marketo | 1.0.0-preview | Confluent Software Evaluation License | Confluent, Inc. | 2020-10-20 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-marketo/) |
| confluentinc-kafka-connect-mqtt | 1.4.1 | Confluent Software Evaluation License | Confluent, Inc. | 2021-06-10 | [documentation](https://docs.confluent.io/kafka-connect-mqtt/current/index.html) |
| confluentinc-kafka-connect-omnisci | 1.0.3 | Confluent Software Evaluation License | Confluent, Inc. | 2021-05-07 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-omnisci/) |
| confluentinc-kafka-connect-oracle-cdc | 1.2.3 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-02 | [documentation](https://docs.confluent.io/kafka-connect-oracle-cdc/current/) |
| confluentinc-kafka-connect-pagerduty | 1.0.2 | Confluent Software Evaluation License | Confluent, Inc. | 2020-11-18 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-pagerduty/) |
| confluentinc-kafka-connect-pivotal-gemfire | 1.0.6 | Confluent Software Evaluation License | Confluent, Inc. | 2021-03-09 | [documentation](https://docs.confluent.io/kafka-connect-pivotal-gemfire/current/index.html) |
| confluentinc-kafka-connect-prometheus-metrics | 1.1.6-preview | Confluent Software Evaluation License | Confluent, Inc. | 2021-08-12 | [documentation](https://docs.confluent.io/kafka-connect-prometheus-metrics/current/index.html) |
| confluentinc-kafka-connect-rabbitmq | 1.5.2 | Confluent Software Evaluation License | Confluent, Inc. | 2021-08-02 | [documentation](https://docs.confluent.io/kafka-connect-rabbitmq-source/current/index.html) |
| confluentinc-kafka-connect-rabbitmq-sink | 1.5.2 | Confluent Software Evaluation License | Confluent, Inc. | 2021-08-02 | [documentation](https://docs.confluent.io/kafka-connect-rabbitmq-sink/current/index.html) |
| confluentinc-kafka-connect-replicator | 6.2.0 | Confluent Software Evaluation License | Confluent, Inc. | 2021-06-08 | [documentation](https://docs.confluent.io/kafka-connect-replicator/current/index.html) |
| confluentinc-kafka-connect-s3 | 10.0.2 | Confluent Community License | Confluent, Inc. | 2021-09-08 | [documentation](https://docs.confluent.io/kafka-connect-s3-sink/current/index.html) |
| confluentinc-kafka-connect-s3-source | 1.4.7 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-10 | [documentation](https://docs.confluent.io/kafka-connect-s3-source/current/index.html) |
| confluentinc-kafka-connect-salesforce | 1.10.3 | Confluent Software Evaluation License | Confluent, Inc. | 2021-08-13 | [documentation](https://docs.confluent.io/kafka-connect-salesforce/current/index.html) |
| confluentinc-kafka-connect-salesforce-bulk-api | 1.10.3 | Confluent Software Evaluation License | Confluent, Inc. | 2021-08-13 | [documentation](https://docs.confluent.io/kafka-connect-salesforce-bulk-api/current/index.html) |
| confluentinc-kafka-connect-servicenow | 2.3.4 | Confluent Software Evaluation License | Confluent, Inc. | 2021-08-30 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-servicenow/) |
| confluentinc-kafka-connect-sftp | 2.3.6 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-21 | [documentation](https://docs.confluent.io/kafka-connect-sftp/current/index.html) |
| confluentinc-kafka-connect-snmp | 1.1.2 | Confluent Software Evaluation License | Confluent, Inc. | 2020-04-09 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-snmp-trap/) |
| confluentinc-kafka-connect-solace-sink | 1.4.1 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-01 | [documentation](https://docs.confluent.io/kafka-connect-solace/current/sink/index.html) |
| confluentinc-kafka-connect-solace-source | 1.2.0 | Confluent Software Evaluation License | Confluent, Inc. | 2020-08-26 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-solace/source) |
| confluentinc-kafka-connect-splunk-s2s | 1.0.3 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-21 | [documentation](https://docs.confluent.io/kafka-connect-splunk-s2s/current/index.html) |
| confluentinc-kafka-connect-splunk-source | 1.0.3 | Confluent Software Evaluation License | Confluent, Inc. | 2020-11-18 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-splunk/splunk-source/) |
| confluentinc-kafka-connect-sqs | 1.2.1 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-20 | [documentation](https://docs.confluent.io/kafka-connect-sqs/current/index.html) |
| confluentinc-kafka-connect-syslog | 1.3.4 | Confluent Software Evaluation License | Confluent, Inc. | 2021-08-27 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-syslog/index.html) |
| confluentinc-kafka-connect-tibco-sink | 1.4.1 | Confluent Software Evaluation License | Confluent, Inc. | 2021-09-01 | [documentation](https://docs.confluent.io/kafka-connect-tibco/current/sink/index.html) |
| confluentinc-kafka-connect-tibco-source | 1.2.0 | Confluent Software Evaluation License | Confluent, Inc. | 2020-08-26 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-tibco/source) |
| confluentinc-kafka-connect-vertica | 1.2.5 | Confluent Software Evaluation License | Confluent, Inc | 2021-02-18 | [documentation](https://docs.confluent.io/kafka-connect-vertica/current/index.html) |
| confluentinc-kafka-connect-weblogic | 11.0.8 | Confluent Software Evaluation License | Confluent, Inc. | 2021-08-10 | [documentation](https://docs.confluent.io/kafka-connect-weblogic-source/current/index.html) |
| confluentinc-kafka-connect-zendesk | 1.0.6 | Confluent Software Evaluation License | Confluent, Inc. | 2021-03-09 | [documentation](https://docs.confluent.io/kafka-connect-zendesk/current/) |
| couchbase-kafka-connect-couchbase | 4.1.1 | Apache License 2.0 | Couchbase, Inc. | 2021-08-20 | [documentation](https://docs.couchbase.com/kafka-connector/current/) |
| debezium-debezium-connector-mongodb | 1.6.0 | Apache 2.0 | Debezium Community | null | [documentation](http://debezium.io/docs/connectors/mongodb/) |
| debezium-debezium-connector-mysql | 1.6.0 | Apache 2.0 | Debezium Community | null | [documentation](http://debezium.io/docs/connectors/mysql/) |
| debezium-debezium-connector-postgresql | 1.6.0 | Apache 2.0 | Debezium Community | null | [documentation](http://debezium.io/docs/connectors/postgresql/) |
| debezium-debezium-connector-sqlserver | 1.6.0 | Apache 2.0 | Debezium Community | null | [documentation](http://debezium.io/docs/connectors/sqlserver/) |
| jcustenborder-kafka-connect-redis | 0.0.2.13 | The Apache License, Version 2.0 | Jeremy Custenborder | 2021-07-07 | [documentation](https://docs.confluent.io/current/connect/kafka-connect-redis/) |
| jcustenborder-kafka-connect-spooldir | 2.0.62 | Apache License 2.0 | Jeremy Custenborder | 2021-04-29 | [documentation](https://docs.confluent.io/kafka-connect-spooldir/current/index.html) |
| microsoftcorporation-kafka-connect-cosmos | 1.1.0 | MIT License | Microsoft Corporation | 2021-07-08 | [documentation](https://github.com/microsoft/kafka-connect-cosmosdb) |
| mongodb-kafka-connect-mongodb | 1.6.1 | The Apache License, Version 2.0 | MongoDB | 2021-08-11 | [documentation](https://github.com/mongodb/mongo-kafka/blob/master/README.md) |
| neo4j-kafka-connect-neo4j | 1.0.9 | Apache License, Version 2.0 | Neo4j, Inc. | 2020-09-02 | [documentation](https://neo4j-contrib.github.io/neo4j-streams/#_kafka_connect) |
| snowflakeinc-snowflake-kafka-connector | 1.5.5 | Apache License, Version 2.0 | Snowflake, Inc. | 2021-06-22 | [documentation](https://docs.snowflake.net/manuals/user-guide/kafka-connector.html) |
| splunk-kafka-connect-splunk | 2.0.2 | Apache 2.0 | Splunk | null | [documentation](https://docs.confluent.io/current/connect/kafka-connect-splunk/splunk-sink) |
| streamthoughts-kafka-connect-file-pulse | 2.3.0 | The Apache Software License, Version 2.0 | StreamThoughts | 2021-09-04 | [documentation](https://github.com/streamthoughts/kafka-connect-file-pulse) |
| wepay-kafka-connect-bigquery | 2.1.7 | Apache License 2.0 | WePay | 2021-09-09 | [documentation](https://docs.confluent.io/kafka-connect-bigquery/current/index.html) |
