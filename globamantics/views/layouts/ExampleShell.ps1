Set-AWSCredential -AccessKey AKIAIZOK3TE2KUKIZR2Q -SecretKey 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 -StoreAs MyAWSProfile
Get-AWSCredential -ListProfileDetail
Set-AWSCredential -ProfileName MyAWSProfile
setx AWS_DEFAULT_PROFILE MyAWSProfile
aws configure

aws cloudformation validate-template --template-body file://"d:/SourceCode/Pluralsight_CloudFormation/Simple LB Webserver.yml"
aws cloudformation create-stack --stack-name SimpleWebApp --template-body file://"d:/SourceCode/Pluralsight_CloudFormation/Simple LB Webserver.yml" `
 --parameters `
    ParameterKey=KeyName,ParameterValue=SamplePSCourse `
    ParameterKey=Subnets,ParameterValue=subnet-79cd781e\,subnet-c7ac1de9 `
    ParameterKey=VPC,ParameterValue=vpc-c145bebb `
 --region us-east-1
aws cloudformation describe-stack-events --stack-name SimpleWebApp
aws cloudformation describe-stacks --stack-name SimpleWebApp
aws cloudformation delete-stack --stack-name SimpleWebApp

aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE
aws cloudformation list-stacks --stack-status-filter DELETE_COMPLETE


#Report running EC2 instances
(Get-EC2Instance -Region us-east-1).Instances.tags | `
 Select-Object  InstanceType , ImageId, @{Name="Servername";Expression={$_.tags | `
     Where-Object key -eq "Name" | Select-Object Value -expand Value}}