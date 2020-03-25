ARG TAG
ARG CP_CONNECT_IMAGE
FROM confluentinc/${CP_CONNECT_IMAGE}:${TAG}
ARG TAG
ARG TAG_BASE
ARG EXCEPTION_TAG
USER root
COPY kafka-connect-couchbase-3.4.5 /usr/share/confluent-hub-components/kafka-connect-couchbase
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-ibmmq:${TAG_BASE}
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-http:latest
RUN confluent-hub install --no-prompt debezium/debezium-connector-mysql:latest
RUN confluent-hub install --no-prompt debezium/debezium-connector-postgresql:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-elasticsearch:${EXCEPTION_TAG}
RUN confluent-hub install --no-prompt wepay/kafka-connect-bigquery:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-gcs:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-hdfs:${EXCEPTION_TAG}
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:${EXCEPTION_TAG}
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-kinesis:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-s3:${EXCEPTION_TAG}
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-s3-source:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-sqs:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-solace-source:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-solace-sink:latest
RUN confluent-hub install --no-prompt debezium/debezium-connector-mongodb:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-activemq:${TAG_BASE}
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-tibco-source:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-replicator:${TAG_BASE}
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-syslog:latest
RUN confluent-hub install --no-prompt splunk/kafka-connect-splunk:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-tibco-sink:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-ibmmq-sink:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-mqtt:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jms:${TAG_BASE}
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-influxdb:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-cassandra:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-gcp-functions:latest
RUN confluent-hub install --no-prompt debezium/debezium-connector-sqlserver:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-activemq-sink:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-splunk-source:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-hdfs3:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-hdfs3-source:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-aws-cloudwatch-logs:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-aws-cloudwatch-metrics:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-aws-dynamodb:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-aws-lambda:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-aws-redshift:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-omnisci:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-rabbitmq:latest
RUN confluent-hub install --no-prompt jcustenborder/kafka-connect-spooldir:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-gcp-pubsub:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-gcp-spanner:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-gcp-dataproc-sink:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jms-sink:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-gcs-source:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-blob-storage:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-blob-storage-source:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-search:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-service-bus:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-data-lake-gen1-storage:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-data-lake-gen2-storage:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-event-hubs:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-functions:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-sql-dw:latest
RUN confluent-hub install --no-prompt neo4j/kafka-connect-neo4j:latest
RUN confluent-hub install --no-prompt confluentinc/connect-transforms:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-sftp:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-hbase:latest
RUN confluent-hub install --no-prompt mongodb/kafka-connect-mongodb:0.2
RUN confluent-hub install --no-prompt jcustenborder/kafka-connect-redis:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-firebase:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-kudu:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-vertica:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-hdfs2-source:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-maprdb:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-snmp:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-servicenow:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-data-diode:latest
RUN confluent-hub install --no-prompt snowflakeinc/snowflake-kafka-connector:latest
