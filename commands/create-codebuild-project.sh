# Create CodeBuild project
aws iam create-role \
    --role-name uda-codebuild-role \
    --assume-role-policy-document file://codebuild-trust-policy.json;

aws iam put-role-policy \
    --role-name uda-codebuild-role \
    --policy-name codebuild-service-permissions \
    --policy-document file://codebuild-permissions-policy.json;

aws codebuild create-project \
    --name uda-codebuild-prj \
    --source '{
        "type": "GITHUB",
        "location": "https://github.com/dpt1305/cd12355-microservices-aws-kubernetes-project-starter.git",
        "auth": {
            "type": "OAUTH",
            "resource": "arn:aws:codeconnections:us-east-1:081322589116:connection/1199e1b4-fecc-440d-9f33-dcba25509ed6"
        },
        "gitSubmodulesConfig": {
            "fetchSubmodules": true
        }
    }' \
    --artifacts type=NO_ARTIFACTS \
    --environment type=LINUX_CONTAINER,image=aws/codebuild/standard:6.0,computeType=BUILD_GENERAL1_SMALL \
    --service-role arn:aws:iam::081322589116:role/uda-codebuild-role \
    --region us-east-1;
