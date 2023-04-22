# Setup Spark Cluster
![beatlytica-spark-cluster drawio](https://user-images.githubusercontent.com/83602292/233758022-59a1e246-0c11-418b-92ee-c810755aa404.png)



To setup the Spark cluster to communicate with the Kafka instance and start reading messages, follow these steps:

1. Establish an SSH connection to the master node of the DataProc cluster that you created earlier using the following command:

   ```bash
   ssh beatlytica-spark-instance
   ```

2. Clone the Git repository that contains the Spark streaming code using the following command:

   ```bash
    git clone  https://github.com/The-Algorist/Beatlytica.git && \
    cd  Beatlytica/terraform
   ```

3. Set the following environment variables to specify the external IP address of the Kafka VM instance and the name of your GCS bucket (which you provided during the Terraform setup):

   ```bash
   export KAFKA_ADDRESS=IP.ADD.RE.SS
   export GCP_GCS_BUCKET=bucket-name
   ```

   **Note:** You will need to set these environment variables every time you create a new shell session or stop/start your cluster.

4. Start reading messages from Kafka using the following command:

   ```bash
   spark-submit \
   --packages org.apache.spark:spark-sql-kafka-0-10_2.12:3.1.2 \
   stream_all_events.py
   ```

   This will start the Spark Streaming process in the DataProc cluster, which will communicate with the Kafka VM instance over port `9092`. If everything went right, you should see new `parquet` files in your GCS bucket. These files are created every two minutes for each topic that the Spark Streaming process is reading from. In this case, the topics are:

   - listen_events
   - page_view_events
   - auth_events
