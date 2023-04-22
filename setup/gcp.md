## GCP

### Initial Setup

1. Create a Google account with your email ID if you haven't already.
2. Go to the [Google Cloud Console](https://console.cloud.google.com/), create a new project and give it a name like "Beatlytica" (or any other unique name). Note down the Project ID as we'll be using it later when deploying infrastructure with Terraform.
3. Set up a service account for this project and grant it the "Viewer" role to begin with:
   * In the Google Cloud Console, go to the *IAM & Admin* section and click on *Service accounts*.
   * Click on *Create Service Account*.
   * Enter a name for the service account, and click *Create*.
   * Select the *Viewer* role and click *Continue*.
   * Click *Done* to create the service account.
   * Download the service account key (`.json`) and save it in a secure location. Do not share it publicly. Rename the downloaded `.json` key file to `google_credentials.json`.
4. Download the [Google Cloud SDK](https://cloud.google.com/sdk/docs/quickstart) and set it up locally.
5. Set the `GOOGLE_APPLICATION_CREDENTIALS` environment variable to point to your downloaded GCP keys:
   ```shell
   export GOOGLE_APPLICATION_CREDENTIALS="<path/to/your/google_credentials.json>"
   
   # Refresh token/session, and verify authentication
   gcloud auth application-default login
   ```
   
### Setup for Access

1. Grant the following IAM roles to your service account in addition to the "Viewer" role:
   * **Storage Admin**
   * **Storage Object Admin**
   * **BigQuery Admin**
   
   To do this:
   * In the Google Cloud Console, go to the *IAM & Admin* section and click on *IAM*.
   * Find the email address of your service account in the list of members.
   * Click the edit icon for your service account.
   * In the *Add Members* field, add the above roles by typing in their names and selecting them from the list. Click *Save*.
   
2. Enable the following APIs for your project:
   * [Cloud Identity and Access Management (IAM) API](https://console.cloud.google.com/apis/library/iam.googleapis.com)
   * [IAM Service Account Credentials API](https://console.cloud.google.com/apis/library/iamcredentials.googleapis.com)
   
   You might also need to enable additional APIs such as DataProc. Check with your project requirements.
   
3. Ensure the `GOOGLE_APPLICATION_CREDENTIALS` environment variable is set:
   ```shell
   export GOOGLE_APPLICATION_CREDENTIALS="<path/to/your/service-account-authkeys>.json"
   ```
   
Reference for installation can be found at [DataTalks Club](https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/week_1_basics_n_setup/1_terraform_gcp/2_gcp_overview.md#initial-setup).


**Tip:** ***Other errors might be caused by lack of enough permissions especially when setting up infrastructure with terraform, follow the process as above to add the permissions causing the errors.***