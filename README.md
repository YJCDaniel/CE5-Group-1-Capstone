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
### Branching Strategies
Production Branch (main)
- [url]([https://github.com/Group1-SCTPCloud/CapstoneProject-DevSecOps-CICDpipeline](https://github.com/YJCDaniel/CE5-Group-1-Capstone/blob/main)

Development Branch (dev)
- [url]([https://github.com/Group1-SCTPCloud/CapstoneProject-DevSecOps-CICDpipeline/tree/dev](https://github.com/YJCDaniel/CE5-Group-1-Capstone/tree/Dev)

Feature Branch (feature)
- [url]([https://github.com/Group1-SCTPCloud/CapstoneProject-DevSecOps-CICDpipeline/tree/feature](https://github.com/YJCDaniel/CE5-Group-1-Capstone/tree/Feature)

_______________________________________________________________________________________
### Security


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

- npm audit
![image](https://github.com/YJCDaniel/CE5-Group-1-Capstone/assets/49025893/7f67b935-3069-4b32-91a9-c9e641820b4f)

_______________________________________________________________________________________

### Secrets 

Added AWS access keys to Github secrets for reference, variable name to use:

![image](https://github.com/YJCDaniel/CE5-Group-1-Capstone/assets/153523948/1c1d9483-a486-4b96-8524-1bb189804e6e)
![WhatsApp Image 2024-06-04 at 10 09 04_d3cf59e0](https://github.com/YJCDaniel/CE5-Group-1-Capstone/assets/49025893/8071b4a4-4fec-4210-bd7a-e07db319d84d)
_______________________________________________________________________________________
### CICD Pipeline

For CI Pipeline : 

Create new repositories on GitHub and assign appropriate access to group members as collaborators based on their roles defined.

Deployed Severless Lambda to accept HTTP post request via SES email alerts. Provision backend AWS configuration repository as reference defined to the above CE5-Group 1 Capstone project.

Create Static Web page and run in ECS clusters with the application services deployed to AWS Cloud Production Tier defined for the purpose of this Capstone project.

For CD Pipeline : 

Write CD pipeline
A CD script should be written with Github actions, the static webpage can be built, test and deployed. Concurrence, the application services can be deployed using the CD script concurrently forming the CI/CD pipeline in totality.  

To conform to Cyber security posture , the team conform to AWS prescribed services to provide Web tier authentication, authorisation and accounting ( aka Cloud watch) to strengthen and ensured that each environment tier produce in the CD Scripts conform to security standard, with the priviling condition that credentials with strong key encryption used for deploying production and development environments should be properly sergerated.

From the proper handling of CICD Pipeline Secrets standpoint , the team review and conduct extensive Secret key privilleage access and artifact the result to proof that the Secrets key encrypt and secure the pipeline from end to end are carried out extensively.
_______________________________________________________________________________________
### Artifact for Cloud watch log extract : 

![image](https://github.com/YJCDaniel/CE5-Group-1-Capstone/assets/153523948/173cd3d7-edab-4938-b801-cc6ff205f49b)

### Artifact for SES trigger after post event : 

![image](https://github.com/YJCDaniel/CE5-Group-1-Capstone/assets/153523948/1095a8e5-4be6-46a1-a0bc-956c3f37cebd)

_______________________________________________________________________________________
## Lessons Learnt
- The team under the guidance of the instructors deliberated that while working with multiple tasks functions that are dependent on GitHub actions secrets, the use of `secrets: inherit` should be included in the main workflow to ensure workflows downstream have access to secrets.

- In addition ,for prudent Devops engineer should observe occurance When using composite workflows to handle complex tasks: github secrets need to be inherit and properly stated in Workflow.yml under call_worflow.

- As guided by Course instructors as a best practice , If the project involves more than 1 person working on code relative to the same branch like features(without triggering a pull request need to merge with the code and sent to the repository), this is evidently seem when the team is working on the code, I should always "git pull" frequently to see what are the changes made by others members.

- During the lesson , instructors have highlighted that If we use ```git add .``` accidentally for unwanted files invoke, we should use ```git reset HEAD <filename>``` instead of git stash - this makes the files not able to add into repo unless manually git add <filename> again.

- Lastly , for prudent , awareness of cross origin resource sharing (CORS) settings need to be properly set up in particular when calling the Lambda function from a browser.

## Areas for Improvements
- Given more time , the team can explore a concrete 3-tier architecture with UAT to test bench the static web bench and provide better cyber security posture with the sergeration of the workload. 
- Explore other third party severless function other than AWS managed service to compare performance metics i.e lattency of web loading and resource capacity
- Adopt full scale JIRA project management to organise and dashboard the project workflows 

:-) Happy Coding ! 

