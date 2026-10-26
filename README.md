# Cloud-Student-Complaint-System
## Cloud-Based Student Complaint & Request Management System Using Serverless Architecture
### CampusResolve 🎓

CampusResolve is a cloud-based web application designed to simplify how college students submit complaints and requests to college administration.

The system provides a centralized digital platform where students can raise concerns, monitor their complaint status, and receive updates from administrators.

Built using AWS Serverless Architecture, CampusResolve eliminates the need to maintain traditional servers while providing scalable backend processing, secure role-based authentication, and cloud-based data storage.

**Academic Project:** Third Year B.Sc. Cloud Computing Field Project
**Institution:** New Arts, Commerce and Science College, Ahilyanagar
**Cloud Platform:** Amazon Web Services (AWS)
**Infrastructure Management:** Terraform

---

## 1. Problem Statement

Traditional college complaint management often depends on verbal communication, handwritten applications, or manual follow-ups.

These approaches can result in:

* Delayed complaint resolution.
* Difficulty tracking submitted complaints.
* Lack of transparency between students and administration.
* Inefficient complaint record management.
* Limited visibility into complaint progress.

CampusResolve addresses these challenges by providing a centralized cloud-based complaint management system.

## 2. Project Objectives

* Develop a digital complaint and request management portal.
* Provide separate Student and Administrator interfaces.
* Implement authentication using Amazon Cognito.
* Allow students to submit and track complaints.
* Allow administrators to review and update complaint statuses.
* Store complaint records in Amazon DynamoDB.
* Implement backend operations through AWS Lambda and API Gateway.
* Deploy the frontend using Amazon S3.
* Manage cloud infrastructure through Terraform.

---

## 3. Key Features

### Student Portal

* Secure Student Login.
* Submit new complaints.
* Select the appropriate complaint category.
* View previously submitted complaints.
* Track complaint status.
* Access personal dashboard statistics.
* View administrator status updates.

### Administrator Portal

* Separate Administrator Login.
* View all submitted student complaints.
* Search complaints by title, category, complaint ID or student ID.
* Filter complaints by status.
* View complete complaint details.
* Update complaint status directly.
* Monitor complaint statistics.

### Complaint Status Lifecycle

Complaints support four statuses:

| Status      | Description                             |
| ----------- | --------------------------------------- |
| Pending     | Complaint submitted and awaiting review |
| In Progress | Complaint is being handled              |
| Approved    | Request has been approved               |
| Completed   | Complaint has been resolved             |

---

## 4. AWS Services Used

| AWS Service        | Purpose                                    |
| ------------------ | ------------------------------------------ |
| Amazon S3          | Static frontend website hosting            |
| Amazon Cognito     | User authentication and group management   |
| Amazon API Gateway | REST-style API operations through HTTP API |
| AWS Lambda         | Serverless backend processing              |
| Amazon DynamoDB    | Complaint database                         |
| AWS IAM            | Access permissions for AWS resources       |
| Amazon CloudWatch  | Lambda monitoring and logs                 |
| Terraform          | Infrastructure as Code deployment          |

---

## 5. System Architecture

CampusResolve follows a serverless architecture in which the frontend communicates directly with AWS authentication and backend services.

```text
             STUDENT / ADMIN
                   |
                   v
          AMAZON S3 WEBSITE
         HTML + CSS + JavaScript
                   |
          +--------+--------+
          |                 |
          v                 v
    AMAZON COGNITO     API GATEWAY
    Authentication          |
                             v
                         AWS LAMBDA
                             |
                             v
                       AMAZON DYNAMODB
                       Complaint Records

Monitoring: Amazon CloudWatch
Permissions: AWS IAM
Infrastructure: Terraform
```

### Architecture Diagram

![CampusResolve Architecture](Documentation/ArchitectureDig/field%20project%20architecture%20dig%20img.png)

### Application Workflow

1. A user opens the CampusResolve frontend.
2. Amazon Cognito authenticates the Student or Administrator.
3. The frontend sends an authorized request to API Gateway.
4. API Gateway invokes the appropriate Lambda backend operation.
5. Lambda validates the authenticated user's permissions.
6. Complaint information is stored or retrieved from DynamoDB.
7. The frontend displays the corresponding results.

---

## 6. Technology Stack

| Component               | Technology              |
| ----------------------- | ----------------------- |
| Frontend                | HTML5, CSS3, JavaScript |
| Backend                 | Python                  |
| Authentication          | Amazon Cognito          |
| API                     | Amazon API Gateway      |
| Compute                 | AWS Lambda              |
| Database                | Amazon DynamoDB         |
| Hosting                 | Amazon S3               |
| Monitoring              | Amazon CloudWatch       |
| Infrastructure as Code  | HashiCorp Terraform     |
| Development Environment | Visual Studio Code      |
| Version Control         | Git and GitHub          |

### Frontend Design

CampusResolve features a custom Neon Noir interface with:

* Jet Black.
* Cerulean Blue.
* Neon Rose.
* Responsive dashboard components.
* Complaint statistics cards.
* Searchable administrator management table.
* Interactive complaint-details popup.

---

## 7. Project Structure

```text
Cloud-Student-Complaint-System/
|
|-- Documentation/
|   |-- ArchitectureDig/
|   |-- Synopsis/
|
|-- frontend/
|   |-- index.html
|   |-- style.css
|   |-- app.js
|
|-- lambda/
|   |-- handler.py
|
|-- terraform/
|   |-- main.tf
|   |-- provider.tf
|   |-- api_gateway.tf
|   |-- cognito.tf
|   |-- dynamodb.tf
|   |-- lambda.tf
|   |-- iam.tf
|   |-- cloudwatch.tf
|   |-- outputs.tf
|
|-- Screenshots/
|   |-- 01-campusresolve-login.png
|   |-- ...
|   |-- 17-terraform-infrastructure-verification.png
|
|-- .gitignore
|-- README.md
```

Generated Terraform state files, local backups, credentials and temporary development files are excluded from the public repository.

---

## 8. API Operations

CampusResolve uses an AWS API Gateway HTTP API.

| Method | Endpoint      | Access  | Function                     |
| ------ | ------------- | ------- | ---------------------------- |
| POST   | `/complaints` | Student | Submit a complaint           |
| GET    | `/complaints` | Student | Retrieve personal complaints |
| GET    | `/complaints` | Admin   | Retrieve all complaints      |
| PUT    | `/complaints` | Admin   | Update complaint status      |

User permissions are verified using authenticated Cognito JWT claims and group membership.

---

## 9. Deployment Overview

### Prerequisites

* AWS Account.
* AWS CLI.
* Terraform.
* Python.
* Git.
* Visual Studio Code or another code editor.

### Infrastructure Deployment

Navigate to the Terraform directory:

```bash
cd terraform
```

Initialize Terraform:

```bash
terraform init
```

Validate the configuration:

```bash
terraform validate
```

Review infrastructure changes:

```bash
terraform plan
```

Deploy after reviewing the proposed changes:

```bash
terraform apply
```

AWS resources and costs should be reviewed before deployment.

### Frontend Deployment

The application frontend consists of:

```text
index.html
style.css
app.js
```

These files are deployed to the dedicated Amazon S3 frontend bucket.

The frontend's Cognito Client ID and API Gateway endpoint must match the deployed AWS resources.

### Security Notice

The current S3 static website endpoint uses HTTP rather than HTTPS.

It is provided as an academic static-hosting demonstration and should not be used for entering real student or administrator credentials.

Authenticated application functionality was tested using the local development environment.

For production use, HTTPS hosting, stricter security controls and additional deployment hardening are required.

---

## 10. Implementation Screenshots

The following screenshots document the actual implementation.

### Login Interface

![Login](Screenshots/01-campusresolve-login.png)

### Student Dashboard

![Student Dashboard](Screenshots/06-student-dashboard.png)

### Complaint Submission

![New Complaint](Screenshots/07-new-complaint-form.png)

### Complaint Tracking

![Complaint History](Screenshots/08-student-complaint-history.png)

### Administrator Dashboard

![Admin Dashboard](Screenshots/09-admin-dashboard.png)

### Complaint Management

![Admin Management](Screenshots/10-admin-complaint-management.png)

### Complaint Status Update

![Status Update](Screenshots/11-admin-status-update.png)

### AWS Infrastructure Evidence

Additional AWS implementation screenshots are available in the `Screenshots` directory, including:

* Amazon S3 hosting.
* Amazon Cognito authentication.
* API Gateway routes.
* AWS Lambda backend.
* DynamoDB records.
* CloudWatch monitoring.
* Terraform infrastructure verification.

---

## 11. Testing and Results

The application was tested using Student and Administrator accounts.

| Test Case                           | Result |
| ----------------------------------- | ------ |
| Student authentication              | Passed |
| Administrator authentication        | Passed |
| Complaint submission                | Passed |
| Complaint retrieval                 | Passed |
| Admin complaint management          | Passed |
| Complaint search and filtering      | Passed |
| Complaint details popup             | Passed |
| Admin status update                 | Passed |
| Student status tracking             | Passed |
| S3 static website hosting           | Passed |
| Terraform infrastructure validation | Passed |

### End-to-End Test

The following workflow was successfully verified locally:

**Student submits complaint → Administrator retrieves complaint → Administrator updates status → Student views updated status.**

Complaint data is persisted in Amazon DynamoDB.

---

## 12. Live Website

**CampusResolve S3 Website:**

http://cloud-student-complaint-system-frontend.s3-website.ap-south-1.amazonaws.com

Note: This HTTP endpoint demonstrates the deployed static frontend. Do not enter real credentials through the public HTTP website.

---

## 13. Future Enhancements

Potential improvements include:

* HTTPS-enabled production hosting.
* Complaint notifications.
* Complaint priority management.
* Complaint assignment to specific departments.
* Advanced reporting and analytics.
* File attachment support.
* Improved database query efficiency.
* Automated CI/CD deployment.

---

## 14. Conclusion

CampusResolve demonstrates how AWS serverless technologies can be combined to build a functional student complaint and request management system without maintaining traditional application servers.

The implementation integrates authentication, API management, backend processing, cloud database storage, monitoring and Infrastructure as Code into one application.

The project demonstrates practical knowledge of AWS Cloud Computing, Terraform, serverless application development and role-based access control.

---

**CampusResolve | Cloud-Based Student Complaint & Request Management System**

*Developed as a Third Year B.Sc. Cloud Computing Field Project.*
