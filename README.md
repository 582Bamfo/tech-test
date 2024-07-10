# tech-test
Hi! Firstly, thank you for applying for SCPE (Senior Cloud Platform Engineer) role at Twinkl, we’re really excited to meet you and find out about how your experience can help those who teach!
We’ve come up with a few questions below to help us figure out where your knowledge is, it shouldn’t take too long to complete and will form an integral part of the technical interview.

If you are unsure of anything at all please get in touch with us, we’d be more than happy to elaborate further on any questions you may have.

● In your own words, explain terraform and its primary components.
Terraform is an open-source  (IaC) tool(mainly use for provisioning infra) . It allows  to define, manage, and provision infrastructure resources across various cloud providers and services using HashiCorp configuration language HCL/JSON.
The primary components of Terraform are:

Configuration Files and Synthax: Written in HCL or JSON, these allow to describe the desired state of infrastructure.
Providers: Plugins that interact with specific cloud platforms, SaaS providers, and other APIs. 
Resources: The individual infrastructure components you want to create or manage (e.g.,storage, virtual machines, networks, databases).
State Management: Terraform tracks the current state of your infrastructure and uses it to plan and execute changes.
Modules: Reusable and shareable components of Terraform code for organizing and encapsulating resource configurations.
Block and Arguments

● What are the benefits of using terraform?
1. Multi-Cloud and Provider Agnostic
2.Consistency and Reproducibility
3. Resource Management
4. Collaboration and Teamwork
5.Integration with Other Tools


● You’ve been given the task of assisting a team within Twinkl; they are new to AWS and Terraform and need a bit of help getting off the ground. They have 4 services that manage and a multi-account 3 stage environment model (Dev, Stage, Prod). Each service needs an S3 bucket with appropriate permissions and tags. The buckets have differing requirements,
a. Buckets A and B will be used to host a Single Page Application behind cloudfront
b. Bucket C will be used to store objects like images of customer signatures
c. Bucket D will be used as a temporary store for text documents before they’ve
been processed and ingested after 24 hours. After 48 hours the objects are
no longer required.
You can safely assume that the team already has pipelines, access and terraform set up with state buckets, locking etc..
Write some terraform to create infrastructure for the above scenario

● Twinkl has a 20TB MySQL 5.7 database that needs to be migrated from Rackspace to AWS. What steps would you take to move this in a safe and reliable fashion?
● You are just starting to build a landing zone in AWS to allow Twinkl product teams to begin using AWS to host their applications. How can the cloud platform team help Twinkl product work to AWS Good Practice?


First gather and understand the requirement and further leverage on AWS Well-Architected Framework pillars of operational excellence, security, reliability, performance efficiency, and cost optimization.

Implement AWS Control Tower with landing zone:
Set up multi-account environments -audit,logging,sanddbox, others
Enforce governance and compliance

Use AWS Organizations:
Centrally manage multiple AWS accounts
Apply service control policies (SCPs)


Implement Identity and Access Management (IAM), identity center:
Use principle of least privilege
Implement role-based access control
Group level policies


Logging and Monitoring:
Enable AWS CloudTrail
Set up Amazon CloudWatch
Use AWS Config for resource tracking


Cost Management:
Implement tagging strategies
Set up AWS Budgets and Cost Explorer


Security Best Practices:
Enable AWS GuardDuty for threat detection
Use AWS Security Hub for security posture management


Infrastructure as Code:
AWS CloudFormation or Terraform


Continuous Integration/Continuous Deployment (CI/CD):
CICD tool - Jenkins

Training and Documentation:
Provide AWS training resources
Create internal best practice guides