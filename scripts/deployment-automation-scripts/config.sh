############################################
#  AWS Regions
############################################
PRIMARY_REGION="us-east-2"
DR_REGION="eu-west-2"

############################################
#  Terraform Backend Config
############################################
TF_STATE_BUCKET_NAME="terraform-state-101120255555"
TF_STATE_BUCKET_REGION="eu-central-1"

############################################
#  Docker / Container Config
############################################
DOCKERHUB_IMAGE="qaysalnajjad/ecs-wordpress-app:v3.6"
ECR_REPO_NAME="ecs-wordpress-app"

############################################
#  Media S3 buckets
############################################
PRIMARY_MEDIA_S3_BUCKET="wordpress-media-primary-2004"
DR_MEDIA_S3_BUCKET="wordpress-media-dr-2004"

############################################
#  Media S3 buckets
############################################
RDS_IDENTIFIER="wordpress-rds"

############################################
#  Domain and hosted zone
############################################
HOSTED_ZONE_ID="Z0201471MCIEQVEUEMQF"
PRIMARY_DOMAIN="rqays.com"   # Primary custom domain without www (e.g., yourdomain.com)
CERTIFICATE_SANs='["*.rqays.com"]'

############################################
#  SSL certificates
############################################
PRIMARY_ALB_SSL_CERTIFICATE_ARN="arn:aws:acm:us-east-2:174512274809:certificate/80cf0123-dc9b-44ab-90d4-6c1f6bb1d951"
DR_ALB_SSL_CERTIFICATE_ARN=""
CLOUDFRONT_SSL_CERTIFICATE_ARN="arn:aws:acm:us-east-1:174512274809:certificate/bfdb54d1-e12c-483e-9c4a-e5697af6c65d"
