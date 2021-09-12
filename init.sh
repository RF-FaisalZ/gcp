./xonotic-network.sh
./patch-2/xonotic-network_US.sh

export PROJECT_ID=mountkirk-test             # enter GCP Project ID
export SERVICE_ACCOUNT_ID=xonotic-sa         # enter GCP custom service account to use

gcloud iam service-accounts create $SERVICE_ACCOUNT_ID

gcloud projects add-iam-policy-binding $PROJECT_ID \
--member="serviceAccount:$SERVICE_ACCOUNT_ID@$PROJECT_ID.iam.gserviceaccount.com" \
--role="roles/viewer"

gcloud projects add-iam-policy-binding $PROJECT_ID \
--member="serviceAccount:$SERVICE_ACCOUNT_ID@$PROJECT_ID.iam.gserviceaccount.com" \
--role="roles/gameservices.viewer"

gcloud projects add-iam-policy-binding $PROJECT_ID \
--member="serviceAccount:$SERVICE_ACCOUNT_ID@$PROJECT_ID.iam.gserviceaccount.com" \
--role="roles/cloudbuild.serviceAgent"
