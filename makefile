install-aws-cli:
	curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
	sudo installer -pkg AWSCLIV2.pkg -target /
config-aws-s3:
	aws configure set aws_access_key_id $$AWS_ACCESS_KEY_ID
	aws configure set aws_secret_access_key $$AWS_SECRET_ACCESS_KEY
	aws configure set default.region $$AWS_REGION
get-app-store-connect-file:
	aws s3 cp s3://$$AWS_APP_STORE_BUCKET/$$AWS_APP_STORE_FILENAME fastlane