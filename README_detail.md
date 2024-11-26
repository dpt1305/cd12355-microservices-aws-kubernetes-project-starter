## Set up cluster
> ./commands/create-cluster.sh

## Set up database and application 
> ./commands/create-db&app.sh

## Set up CodeBuild project
> ./commands/create-codebuild-project.sh

## Set up ECR repository
> ./commands/create-ecr.sh

## Result
1. CodeBuild pipeline logs:
![](image/codebuild_log_1.png)
![](image/codebuild_log_2.png)
![](image/codebuild_log_3.png)
![](image/codebuild_log_4.png)
![](image/codebuild_log_5.png)
![](image/codebuild_log_6.png)

2. ECR image
![](image/ecr_image.png)

3. Run ```kubectl get pods```
![](image/kubectl_get_pod.png)

4. Run ```kubectl describe svc postgresql-service```
![](image/kubectl_describe_svc.png)

5. Run ```kubectl describe deployment coworking``
![](image/kubectl_describe_deployment.png)

6. CloudWatch logs:
![](image/cloudwatch_log_application.png)
![](image/cloudwatch_loggroups.png)
