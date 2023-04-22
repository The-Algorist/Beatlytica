# Debugging Guide

## General Guidelines

- Always ensure that the environment variables are set.

- **Start the processes in this order - Kafka -> Eventsim -> Spark Streaming -> Airflow.**

- Monitor the CPU utilization for your VMs to detect any anomalies.

### Kafka

- If the `broker` and `schema-registry` containers die during startup, the control center might not be available over port 9021. In such a case, stop all containers with `docker-compose down` or `ctrl+C` and rerun `docker-compose up`.

- If you do not set the `KAFKA_ADDRESS` environment variable, Kafka will write to `localhost`, which will prevent Spark from reading messages.

### Eventsim

- If you start with a high number of users, such as 2-3 million, Eventsim might not start and get stuck at generating events. In such cases, lower the number of users or start two parallel processes with users divided.

### Spark

- If you get an error such as `Connection to node -1 (localhost/127.0.0.1:9092) could not be established. Broker may not be available`, ensure that the `KAFKA_ADDRESS` environment variable is set with the external IP address of the Kafka VM. If it's set and things still do not work, restart the cluster.

### Airflow

- If you encounter permission denied errors when writing logs to the dbt folder, run the `airflow_startup.sh` script, which handles changing permissions for the dbt folder. In case you happen to delete and recreate the folder or did not run the `airflow_startup.sh` script, change the dbt folder permissions manually with the following command:

```bash
sudo chmod -R 777 dbt/
```

**Tip:** ***Other errors might be caused by lack of enough permissions especially when setting up infrastructure with terraform, follow the process as above to add the permissions causing the errors.***