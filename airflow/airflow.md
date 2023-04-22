# Setup Airflow VM

1.  Establish an SSH connection to the compute instance:
    
    ```bash
    `ssh beatlytica-airflow-instance` 
    ```
    
2.  Clone the Git repository:
    
```bash
    git clone https://github.com/The-Algorist/Beatlytica.git && \
    cd  Beatlytica
```
    
3.  Install Anaconda, Docker, and Docker Compose:
    
    ```bash
    `bash ~/Beatlytica/scripts/vm_setup.sh && \
     exec newgrp docker` 
    ```
    
4.  Transfer the Google Cloud service account JSON file to the VM machine:
    
    -   Use `sftp` to transfer the file.
        
    -   ***Move the service account JSON file from local to the VM machine in `~/.google/credentials/` directory. Make sure it is named as `google_credentials.json` else the DAGs will fail!***
        
5.  Set the environment variables (same as Terraform values):
    
    -   GCP Project ID
        
    -   Cloud Storage Bucket Name
        
    
    ```bash
    export GCP_PROJECT_ID=project-id
    export GCP_GCS_BUCKET=bucket-name` 
   ``
    **Note:** ***You will have to set up these environment variables every time you create a new shell session.***
    
6.  Start Airflow. This shall take a few minutes:
    
    ```bash
    `bash ~/Beatlytica/scripts/airflow_startup.sh && cd ~/Beatlytica/airflow` 
    
7.  Airflow should be available on port `8080` a couple of minutes after the above setup is complete. Login with default username & password as **airflow**.
    
8.  Airflow will be running in detached mode. To see the logs from Docker, run the following command:
    
    ```bash
    `docker-compose --follow` 
    ```
    
9.  To stop Airflow:
    
    ```bash
    `docker-compose down`
    ```
  

### DAGs

The setup has two dags

-  `load_songs_dag`

- Trigger first and only once to load a onetime song file into BigQuery


-  `beatlytica_dag`

- Trigger after `load_songs_dag` to make sure the songs table table is available for the transformations

- This dag will run hourly at the 5th minute and perform transformations to create the dimensions and fact.


- DAG Flow -

- We first create an external table for the data that was received in the past hour.

- We then create an empty table to which our hourly data will be appended. Usually, this will only ever run in the first run.

- Then we insert or append the hourly data, into the table.

- And then, delete the external table.

- Finally, run the dbt transformation, to create our dimensions and facts.
- 
### dbt

The transformations happen using dbt which is triggered by Airflow. The dbt lineage should look something like this -

Dimensions:

-  `dim_artists`

-  `dim_songs`

-  `dim_datetime`

-  `dim_location`

-  `dim_users`
-
Facts:
-  `fact_streams`

Partitioning:

- Data is partitioned on the timestamp column by hour to provide faster data updates for a dashboard that shows data for the last few hours.

  

Finally, we create `wide_stream` view to aid dashboarding.