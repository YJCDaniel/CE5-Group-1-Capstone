# CapstoneProject-DevOps-CICDpipeline Group 1
_______________________________________________________________________________________
## Company Profile
SparkClean is a traditional cleaning company that specializes in cleaning house and small office. SparkClean used to take in services through phone call or walk in service. In year 2020 after Covid-19 hits the world, SparkClean decided to change their businesss by digitalization of taking the service order from phone call to Web request. 

Link: http://ce5-grp1-ecs-alb-1434311630.us-east-1.elb.amazonaws.com/


## The Team Consist of:
- James Tan
- Daniel Yang
- ZhiYong Tan
- Tom Wang
_______________________________________________________________________________________
## Getting started

To host a simple HTML file on an S3 static website, you can use a CI/CD pipeline to create an S3 bucket using Terraform. The newest index.html file from this GitHub repository can then be uploaded and automatically updated whenever there is a push to any branch.

_______________________________________________________________________________________
## Dependencies

- npm
- AWS S3 bucket
- Snyk
- Terraform
- ECR
- ECS
- Route 53
- Lambda
- SES

_______________________________________________________________________________________
## Application Structure

**workflow to run one after another**

- to use a new <workflow>.yml file: 
    - add workflow dispatch
    - add  call-workflow1:
    -       call-workflow2:
    - add secrets to be inherit

    - note that there cannot be more than 3 workflow, not supported


**s3 bucket**
```
S3 Bucket for web hosting
- after creation of s3 bucket, go into: 
   - properties -> ensure Static website hosting is enabled
   - permissions -> ensure bucket policy is made public 
   - bucket name: group1-staticwebsite-bucket123321
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadmeGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::group1-staticwebsite-bucket123321/*"
        }
    ]
}
```


_______________________________________________________________________________________
### Architecture Diagram

<img width="553" alt="image" src="https://github.com/YJCDaniel/CE5-Group-1-Capstone/assets/150350335/1ca748ac-3a15-44a7-9084-025fb9b113cb">


_______________________________________________________________________________________
## Branching Strategies
Production Branch (main)
- [url](https://github.com/Group1-SCTPCloud/CapstoneProject-DevSecOps-CICDpipeline)

Development Branch (dev)
- [url](https://github.com/Group1-SCTPCloud/CapstoneProject-DevSecOps-CICDpipeline/tree/dev)

Feature Branch (feature)
- [url](https://github.com/Group1-SCTPCloud/CapstoneProject-DevSecOps-CICDpipeline/tree/feature)

_As we uses simple html code, we have only a dev branch then to production branch_
_______________________________________________________________________________________
## Security


**Branch protection rule activation for github**

For Main and Dev Branch:

- setting > branch > branch protection rule > add a new rule > 
  - select the branch to protect
  - Enabled "require a pull request before merging"
  - Enabled "require approval"
  - Enabled "require status checks to pass before merging"

For Main Branch:

- Enabled "Secrets scanning and push protection"
- Enabled "Do not allow bypassing the above settings in main branch"

(we can also add should we also enable "Require review from Code Owners")

**Added Vulnerability Scan**

- Snyk
![image](https://github.com/YJCDaniel/CE5-Group-1-Capstone/assets/49025893/f42e4fea-0d76-41b6-a281-423ff49d89ec)

  
- npm audit

_______________________________________________________________________________________

## Secrets 

Added AWS access keys to Github secrets for reference, variable name to use:
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- BUCKET_TF_STATE
- SNYK_TOKEN

_______________________________________________________________________________________

**Key Roles**
- Web Developer 
- DevOps 
- Cloud Engineer 


### Lessons Learnt
- When working with multiple that are dependent on GitHub actions secrets, the use of `secrets: inherit` should be included in the main workflow to ensure workflows downstream have access to secrets.

- When using composite workflow: eg call_workflow, cannot have more than 3 workflows. 

- When using composite workflow: github secrets needs to be inherited, stated in Workflow.yml under call_worflow

- If more than 1 person working on code on same branch like feature(without pull request needed to marge with code to repository), when I am working, I should always "git pull" frequently to see what are the changes made by others.

- If use ```git add .``` accidentally for unwanted files, use ```git reset HEAD <filename>``` instead of git stash - this makes the files not able to add into repo unless manually git add <filename> again.

### Areas for Improvements
- Can parameterize bucket names and environment attributes in Github secrets and variables instead of hard coding in Terraform script for for flexibility

- Can use container to get all the advance features for index.html to look professional with CSS.

- 

_______________________________________________________________________________________
## CICD Pipeline


Create New Project 
Create 2 new repositories on GitHub and assign appropriate access to the group members as collaborators based on their role.
Web application repository 
Backend AWS configuration repository

Create Static Web Application (S3) 
Create 2 versions of a static website to be hosted on S3 to simulate a working CD pipeline

Application is deployed to AWS.

Write CD pipeline
A CD script should be written with Github actions The static webpages can be built, tests can be run, and the application can be deployed using the CD script. 

Proper authentication and authorization are to be ensured in each environment in the CD Script, with the condition that credentials used for deploying development and production environments should not be the same.

Proper handling of CICD Pipeline Secrets is to be carried out.

-  Master Branch is secured
-  Work with Pull Request & Merging
-  Create new Role on AWS and use the secret into Github, Not User
-  Get Key from AWS

Write the Terraform script to be used in the CD pipeline.
- Create a S3 bucket for storage of Terraform state
-  Ensure that the .tf state file is stored remotely in a S3 bucket
-  Terraform script should replace the old version of the static website within the same bucket.




_______________________________________________________________________________________
