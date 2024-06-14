# CapstoneProject-DevOps-CICDpipeline Group 1
_______________________________________________________________________________________
## Company Profile
SparkClean is a traditional cleaning company that specializes in cleaning house and small office. SparkClean used to take in services through phone call or walk in service. In year 2020 after Covid-19 hits the world, SparkClean decided to change their businesss by digitalization of taking the service order from phone call to Web request. 

Link: http://ce5-grp1-cleaningservices.sctp-sandbox.com 

_______________________________________________________________________________________
## The Team Consist of:
- James Tan
- Daniel Yang
- ZhiYong Tan
- Tom Wang
_______________________________________________________________________________________
## Getting started

To host a simple HTML enquiry form to collect customer details and triggers a lambda function to send an email using AWS SES with the customer details. 

_______________________________________________________________________________________
## Tools and Technologies used:

- npm
- AWS S3 bucket
- Snyk
- Terraform
- ECR
- ECS
- Route 53
- Lambda
- SES
- Serverless
- Docker
_______________________________________________________________________________________
### Architecture Diagram

<img width="553" alt="image" src="https://github.com/YJCDaniel/CE5-Group-1-Capstone/assets/150350335/1ca748ac-3a15-44a7-9084-025fb9b113cb">

_______________________________________________________________________________________
## Branching Strategies
Production Branch (main)
- [url]([https://github.com/Group1-SCTPCloud/CapstoneProject-DevSecOps-CICDpipeline](https://github.com/YJCDaniel/CE5-Group-1-Capstone/blob/main)

Development Branch (dev)
- [url]([https://github.com/Group1-SCTPCloud/CapstoneProject-DevSecOps-CICDpipeline/tree/dev](https://github.com/YJCDaniel/CE5-Group-1-Capstone/tree/Dev)

Feature Branch (feature)
- [url]([https://github.com/Group1-SCTPCloud/CapstoneProject-DevSecOps-CICDpipeline/tree/feature](https://github.com/YJCDaniel/CE5-Group-1-Capstone/tree/Feature)

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
![image](https://github.com/YJCDaniel/CE5-Group-1-Capstone/assets/49025893/56e8897c-8aec-4e3a-8351-789c6f1a6708)
_______________________________________________________________________________________

## Secrets 

Added AWS access keys to Github secrets for reference, variable name to use:

- ![WhatsApp Image 2024-06-04 at 10 09 04_d3cf59e0](https://github.com/YJCDaniel/CE5-Group-1-Capstone/assets/49025893/8071b4a4-4fec-4210-bd7a-e07db319d84d)

_______________________________________________________________________________________
## CICD Pipeline

Create New Project 
Create 2 new repositories on GitHub and assign appropriate access to the group members as collaborators based on their role.
Web application repository 
Backend AWS configuration repository

Create Static Web page to run in ECS cluster.

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
-  Create a S3 bucket for storage
_______________________________________________________________________________________

### Lessons Learnt
- When working with multiple that are dependent on GitHub actions secrets, the use of `secrets: inherit` should be included in the main workflow to ensure workflows downstream have access to secrets.

- When using composite workflow: eg call_workflow, cannot have more than 3 workflows. 

- When using composite workflow: github secrets needs to be inherited, stated in Workflow.yml under call_worflow

- If more than 1 person working on code on same branch like feature(without pull request needed to marge with code to repository), when I am working, I should always "git pull" frequently to see what are the changes made by others.

- If use ```git add .``` accidentally for unwanted files, use ```git reset HEAD <filename>``` instead of git stash - this makes the files not able to add into repo unless manually git add <filename> again.

### Areas for Improvements
- Can parameterize bucket names and environment attributes in Github secrets and variables instead of hard coding in Terraform script for for flexibility

- Can use container to get all the advance features for index.html to look professional with CSS.

  _______________________________________________________________________________________

