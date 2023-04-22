# Setting up Terraform Infrastructure

***To spin up the infrastructure for Beatlytica project, follow these steps:***

1. Clone the repository in your local machine.

```bash
git clone https://github.com/The-Algorist/Beatlytica.git && \
cd Beatlytica/terraform
```

2. Initiate terraform and download the required dependencies by running the following command in the terminal:

```bash
terraform init
```

3. View the Terraform plan. You will be prompted to enter two values, the name of the GCS bucket you want to create and your GCP Project ID. Use the same values throughout the project. Run the following command:

```bash
terraform plan
```

4. The Terraform plan should show the creation of the following services:
  - `n2-standard-4` Compute Instance for Kafka
  - `n2-standard-4` Compute Instance for Airflow
  - Dataproc Spark Cluster
    - One `n1-standard-2` Master node(***I configured manually, the terraform block for this is in the terraform.txt file***)
    - (***Optional***)Two `n1-standard-2` Worker nodes 
  - A Google Cloud Storage bucket
  - Two Bigquery Datasets
    - streamify_stg
    - streamify_prod
  - Firewall rule to open port `9092` on the Kafka Instance

5. Apply the infrastructure by running the following command:

```bash
terraform apply
```

***Note that billing will start as soon as the apply is complete.***

6. Once you are done with the project, you can teardown the infrastructure by running the following command:

```bash
terraform destroy
```

***Note that this will delete all resources created during the `terraform apply` step.***

**Note:** *the infrastructure may have been provisioned with more computing resources than necessary. To test this, you can try reducing the instance sizes and observe the performance.*

**Tip:** ***Other errors might be caused by lack of enough permissions especially when setting up infrastructure with terraform, follow the process as above to add the permissions causing the errors.***