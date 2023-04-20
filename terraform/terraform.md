# Setting up Terraform Infrastructure


1. Clone the repository in your local machine.

```bash
git clone https://github.com/The-Algorist/Beatlytica.git && \
cd Beatlytica/terraform
```

2. Spin up the Infrastructure -

- Initiate terraform and download the required dependencies-

  ```bash
  terraform init
  ```

- View the Terraform plan

  You will be asked to enter two values, the name of the GCS bucket you want to create and your GCP Project ID. Use the same values throughout the project.

  ```bash
  terraform plan
  ```

- Terraform plan should show the creation of following services -

  - `e2-standard-4` Compute Instance for Kafka
  - `e2-standard-4` Compute Instance for Airflow
  - Dataproc Spark Cluster
    - One `e2-standard-2` Master node
    - Two `e2-medium` Worker nodes
  - A Google Cloud Storage bucket
  - Two Bigquery Datasets
    - streamify_stg
    - streamify_prod
  - Firewall rule to open port `9092` on the Kafka Instance

3. Apply the infra. **Note** - Billing will start as soon as the apply is complete.

  ```bash
  terraform apply
  ```

4. Once you are done with the project. Teardown the infra using-

  ```bash
  terraform destroy
  ```

**Note:** I may have provisioned the infrastructure with more computing resources than necessary. It's possible that the current instance sizes are not fully utilized. To test this, I'm planning to reduce the instance sizes and observe the performance.