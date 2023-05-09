#  Epam Project

CICD pipeline using jenkins and CodePipeline to deploy a nodejs app in docker container on aws ec2





## Tools used

- Terraform - for creating s3 bucket,roles and ec2    
- SSH - for installing and configure jenkins in ec2
- AWS CodePipeline - for fetching code from github by push trigger and deploying to s3 bucket
- AWS SQS - for creating a trigger for jenkins from s3 bucket object creation alarm
- jenkins - for fetcing code from s3 build and deploying docker
- Docker  - for creating a nodejs application container


