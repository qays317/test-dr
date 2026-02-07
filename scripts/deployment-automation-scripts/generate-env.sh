#!/usr/bin/env bash
set -e

CONFIG_FILE="$(dirname "$0")/../config.yaml"
RUNTIME_DIR="$(dirname "$0")/runtime"
OUT_FILE="${RUNTIME_DIR}/env.generated"

mkdir -p "$RUNTIME_DIR"

command -v yq >/dev/null 2>&1 || {
  echo "❌ yq is required"; exit 1;
}

cat <<EOF > "$OUT_FILE"
# Generated — DO NOT EDIT

TF_STATE_BUCKET_NAME=$(yq '.terraform.backend.bucket_name' "$CONFIG_FILE")
TF_STATE_BUCKET_REGION=$(yq '.terraform.backend.region' "$CONFIG_FILE")

DOCKERHUB_IMAGE=$(yq '.docker.dockerhub_image' "$CONFIG_FILE")
ECR_REPO_NAME=$(yq '.docker.ecr_repo_name' "$CONFIG_FILE")

PRIMARY_MEDIA_S3_BUCKET=$(yq '.media.s3.primary_bucket' "$CONFIG_FILE")
DR_MEDIA_S3_BUCKET=$(yq '.media.s3.dr_bucket' "$CONFIG_FILE")

RDS_IDENTIFIER=$(yq '.rds.identifier' "$CONFIG_FILE")

HOSTED_ZONE_ID=$(yq '.dns.hosted_zone_id' "$CONFIG_FILE")
PRIMARY_DOMAIN=$(yq '.dns.primary_domain' "$CONFIG_FILE")
CERTIFICATE_SANs=$(yq -o=json '.dns.certificate_sans' "$CONFIG_FILE")

PRIMARY_ALB_SSL_CERTIFICATE_ARN=$(yq '.certificates.alb.primary' "$CONFIG_FILE")
DR_ALB_SSL_CERTIFICATE_ARN=$(yq '.certificates.alb.dr' "$CONFIG_FILE")
CLOUDFRONT_SSL_CERTIFICATE_ARN=$(yq '.certificates.cloudfront' "$CONFIG_FILE")
EOF

echo "✅ Runtime env generated at ${OUT_FILE}"
