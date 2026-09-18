# ☁️ AWS Cloud DevOps Platform

<p align="center">
  <strong>Production-Grade Cloud Native Store</strong><br/>
  Docker • Kubernetes • AWS EKS • Terraform • Helm • GitHub Actions • ArgoCD • OpenTelemetry
</p>

<p align="center">

![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazonaws)
![Kubernetes](https://img.shields.io/badge/Kubernetes-EKS-326CE5?logo=kubernetes)
![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?logo=terraform)
![Docker](https://img.shields.io/badge/Docker-Containerization-2496ED?logo=docker)
![Helm](https://img.shields.io/badge/Helm-Packaging-0F1689?logo=helm)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-CI-2088FF?logo=githubactions)
![ArgoCD](https://img.shields.io/badge/ArgoCD-GitOps-EF7B4D?logo=argo)
![OpenTelemetry](https://img.shields.io/badge/OpenTelemetry-Observability-425CC7)

</p>

---

## 🚀 Overview

This project implements a **production-oriented cloud-native platform on AWS**, combining modern DevOps, Kubernetes, Infrastructure as Code, CI/CD, GitOps, observability, security, and cloud-native data services.

The platform is designed around a **microservices architecture** deployed on **Amazon EKS**, with infrastructure provisioned using **Terraform** and applications packaged using **Helm**.

The complete platform brings together:

* 🐳 Containerized microservices
* ☸️ Kubernetes on Amazon EKS
* 🏗️ Infrastructure as Code with Terraform
* 📦 Helm-based application deployment
* ⚙️ Automated CI with GitHub Actions
* 🔄 GitOps-based CD with ArgoCD
* 📈 Kubernetes autoscaling with HPA
* 🚀 Dynamic node provisioning with Karpenter
* 🔐 AWS-native security and secrets management
* 📊 OpenTelemetry-based observability
* 🗄️ Managed AWS databases and messaging services

---

# 🏛️ Platform Architecture

```text
                           ┌─────────────────────┐
                           │       Users         │
                           └──────────┬──────────┘
                                      │
                                      ▼
                           ┌─────────────────────┐
                           │   Route 53 / DNS    │
                           └──────────┬──────────┘
                                      │
                                      ▼
                           ┌─────────────────────┐
                           │   AWS Load Balancer │
                           │       Controller   │
                           └──────────┬──────────┘
                                      │
                                      ▼
                    ┌──────────────────────────────────┐
                    │          Amazon EKS               │
                    │                                  │
                    │   ┌──────────────────────────┐   │
                    │   │        Store         │   │
                    │   │                          │   │
                    │   │  UI       Carts          │   │
                    │   │  Catalog  Orders         │   │
                    │   │  Checkout                │   │
                    │   └──────────────────────────┘   │
                    │                                  │
                    │     HPA + Karpenter              │
                    │     Helm + Kubernetes            │
                    └───────────────┬──────────────────┘
                                    │
             ┌──────────────────────┼──────────────────────┐
             │                      │                      │
             ▼                      ▼                      ▼
      ┌─────────────┐       ┌─────────────┐       ┌─────────────┐
      │ Amazon RDS  │       │ ElastiCache │       │    SQS      │
      │   MySQL     │       │    Redis    │       │   Orders    │
      └─────────────┘       └─────────────┘       └─────────────┘
             │
             ▼
      ┌─────────────┐
      │  DynamoDB   │
      └─────────────┘

        Observability
             │
             ▼
   OpenTelemetry → X-Ray
                 → CloudWatch
                 → Prometheus
                 → Grafana
```

---

# 🛍️ Store Microservices

The application is composed of **five microservices** implemented using different technologies.

| Service     | Technology         | Main Responsibility           |
| ----------- | ------------------ | ----------------------------- |
| 🖥️ UI      | Java / Spring Boot | User interface                |
| 🛒 Carts    | Java / Spring Boot | Shopping cart management      |
| 📦 Catalog  | Go                 | Product catalog               |
| 📋 Orders   | Java / Spring Boot | Order management              |
| 💳 Checkout | Node.js            | Checkout and order processing |

### Application Flow

```text
User
 │
 ▼
UI
 │
 ├──────────────► Catalog ───────► RDS MySQL
 │
 ├──────────────► Carts ──────────► DynamoDB
 │
 └──────────────► Checkout
                       │
                       ├──► Redis
                       │
                       └──► SQS
                              │
                              ▼
                           Orders
                              │
                              ▼
                           RDS
```

---

# ☁️ AWS Infrastructure

The infrastructure is provisioned using **Terraform**.

### Core AWS Services

| Category              | AWS Service             |
| --------------------- | ----------------------- |
| ☸️ Kubernetes         | Amazon EKS              |
| 🌐 Networking         | VPC                     |
| 💾 Relational DB      | Amazon RDS              |
| ⚡ Cache               | Amazon ElastiCache      |
| 🗃️ NoSQL             | Amazon DynamoDB         |
| 📨 Messaging          | Amazon SQS              |
| 🌍 DNS                | Amazon Route 53         |
| 🔒 TLS                | AWS Certificate Manager |
| 📦 Container Registry | Amazon ECR              |
| 📊 Tracing            | AWS X-Ray               |
| 📜 Logs               | Amazon CloudWatch       |

---

# 🏗️ Infrastructure as Code

Terraform manages the AWS infrastructure using reusable and declarative configurations.

### Infrastructure includes

```text
Terraform
   │
   ├── VPC
   │    ├── Public Subnets
   │    └── Private Subnets
   │
   ├── Amazon EKS
   │    ├── Cluster
   │    ├── Node Groups
   │    └── IAM
   │
   ├── Amazon RDS
   ├── ElastiCache
   ├── DynamoDB
   ├── SQS
   └── Supporting AWS resources
```

### Terraform capabilities

* AWS provider configuration
* Variables and outputs
* `tfvars` configuration
* Reusable modules
* VPC provisioning
* EKS provisioning
* IAM configuration
* Remote state
* S3 state storage
* DynamoDB state locking

---

# 🐳 Containerization

Each application component is containerized using Docker.

### Docker workflow

```text
Source Code
     │
     ▼
 Dockerfile
     │
     ▼
Docker Image
     │
     ▼
 Amazon ECR
     │
     ▼
 Kubernetes / EKS
```

### Docker topics implemented

* Docker CLI
* Images and containers
* Dockerfiles
* Container lifecycle
* Docker Hub
* Amazon ECR
* Health checks
* Environment variables
* Security practices
* Multi-stage builds
* BuildKit
* Docker Buildx
* AMD64 / ARM64 multi-platform images

---

# 📦 Docker Compose

Docker Compose is used for local multi-container environments.

Implemented concepts include:

* Services
* Networks
* Named volumes
* Health checks
* Startup dependencies
* Scaling
* Profiles
* Links
* Aliases

---

# ☸️ Kubernetes on Amazon EKS

The platform uses Kubernetes as the application orchestration layer.

### Kubernetes resources

```text
Pods
Deployments
Services
ConfigMaps
Secrets
StatefulSets
PersistentVolumes
PersistentVolumeClaims
StorageClasses
Ingress
```

Additional Kubernetes capabilities include:

* Labels and selectors
* Annotations
* Liveness probes
* Readiness probes
* Resource requests
* Resource limits
* Pod scheduling
* Service discovery
* Stateful workloads

---

# 🚀 Karpenter

Karpenter provides **dynamic node provisioning and scaling** for the EKS cluster.

### Architecture

```text
                 Kubernetes Workload
                         │
                         ▼
                  Pending Pod
                         │
                         ▼
                    Karpenter
                         │
              ┌──────────┴──────────┐
              ▼                     ▼
       On-Demand NodePool       Spot NodePool
              │                     │
              └──────────┬──────────┘
                         ▼
                    EC2 Capacity
```

### Implemented capabilities

* Karpenter installation with Terraform
* EC2NodeClass
* NodePools
* On-Demand instances
* Spot instances
* Instance diversification
* Right-sizing
* Node consolidation
* Dynamic provisioning
* Scheduling optimization

---

# ⚡ Spot Interruption Handling

The platform includes an interruption-handling workflow for Spot instances.

```text
AWS Event
    │
    ▼
EventBridge
    │
    ▼
SQS Queue
    │
    ▼
Karpenter
    │
    ▼
Pod Eviction
    │
    ▼
New Node Provisioned
    │
    ▼
Pods Rescheduled
```

PodDisruptionBudgets are used to improve application availability during disruption events.

---

# 📈 Horizontal Pod Autoscaling

The platform supports Kubernetes HPA using the Metrics Server.

```text
                    Traffic
                       │
                       ▼
                 Application
                       │
                       ▼
                Metrics Server
                       │
                       ▼
                      HPA
                       │
              ┌────────┴────────┐
              ▼                 ▼
         Scale Out          Scale In
              │                 │
              └────────┬────────┘
                       ▼
                   Karpenter
```

Autoscaling is based on:

* CPU utilization
* Memory utilization
* Application workload

---

# ⛵ Helm

Helm is used to package and deploy the application.

### Helm structure

```text
Chart
 ├── Chart.yaml
 ├── values.yaml
 └── templates/
      ├── deployment.yaml
      ├── service.yaml
      ├── configmap.yaml
      ├── ingress.yaml
      └── ...
```

Helm provides:

* Reusable charts
* Configurable values
* Environment-specific configuration
* Versioning
* Packaging
* Release management
* Microservice deployment

---

# 🌐 Ingress & HTTPS

External application access is handled through the AWS Load Balancer Controller.

```text
Internet
   │
   ▼
Route 53
   │
   ▼
ALB
   │
   ▼
Ingress
   │
   ▼
Kubernetes Services
   │
   ▼
Microservices
```

Implemented capabilities:

* AWS Load Balancer Controller
* ALB
* HTTP / HTTPS
* Health checks
* Target groups
* ACM certificates
* SSL/TLS termination
* Route 53 integration
* External DNS
* Custom domains

---

# 🔐 Security

Security is integrated across infrastructure, Kubernetes, and CI/CD.

### Implemented security components

* Kubernetes Secrets
* AWS Secrets Manager
* Secrets Store CSI Driver
* External Secrets
* EKS Pod Identity Agent
* IAM roles
* IAM-based authentication
* RBAC
* IMDSv2
* GitHub Actions OIDC
* No long-lived AWS access keys in CI/CD

---

# 💾 Persistent Storage

The platform supports Kubernetes persistent storage through the EBS CSI driver.

```text
Application
     │
     ▼
PersistentVolumeClaim
     │
     ▼
StorageClass
     │
     ▼
EBS CSI Driver
     │
     ▼
Amazon EBS
```

The storage architecture includes:

* PersistentVolumes
* PersistentVolumeClaims
* StorageClasses
* Dynamic provisioning
* StatefulSets
* Amazon EBS CSI
* Database persistence

---

# 📊 Observability

The platform integrates **OpenTelemetry** to provide application and infrastructure observability.

```text
                    Applications
                         │
                         ▼
                  OpenTelemetry
                         │
            ┌────────────┼────────────┐
            ▼            ▼            ▼
          Traces        Logs        Metrics
            │            │            │
            ▼            ▼            ▼
          X-Ray       CloudWatch   Prometheus
                                      │
                                      ▼
                                    Grafana
```

### Observability stack

| Signal        | Technology                     |
| ------------- | ------------------------------ |
| 🔎 Traces     | OpenTelemetry + AWS X-Ray      |
| 📜 Logs       | CloudWatch                     |
| 📈 Metrics    | Prometheus                     |
| 📊 Dashboards | Grafana                        |
| ⚙️ Collection | ADOT / OpenTelemetry Collector |

The platform also includes OpenTelemetry auto-instrumentation for Java Spring Boot and Node.js applications.

---

# 🔄 CI/CD & GitOps

The deployment pipeline combines **GitHub Actions**, **Amazon ECR**, **Helm**, and **ArgoCD**.

### Complete deployment flow

```text
Developer
    │
    ▼
Git Push
    │
    ▼
GitHub Actions
    │
    ├── Build
    ├── Test
    ├── Containerize
    └── Push Image
             │
             ▼
          Amazon ECR
             │
             ▼
       Helm Configuration
             │
             ▼
           ArgoCD
             │
             ▼
        Amazon EKS
             │
             ▼
       Production App
```

### CI

GitHub Actions handles:

* Automated builds
* Container image creation
* Image publishing
* Semantic versioning
* AWS authentication using OIDC

### CD

ArgoCD provides:

* GitOps deployment
* Automatic synchronization
* Self-healing
* Helm deployment
* Application rollback

---

# 🔄 GitOps Model

```text
             Git Repository
                   │
                   ▼
              ArgoCD
                   │
          ┌────────┴────────┐
          ▼                 ▼
      Sync Changes      Self-Heal
          │                 │
          └────────┬────────┘
                   ▼
                EKS
                   │
                   ▼
              Application
```

The Git repository becomes the desired state of the Kubernetes environment.

---

# 🧩 EKS Add-ons

The platform integrates several EKS components:

* AWS Load Balancer Controller
* Amazon EBS CSI Driver
* EKS Pod Identity Agent
* Secrets Store CSI Driver
* AWS Secrets and Configuration Provider

---

# 🗄️ AWS Data Plane

The retail application uses multiple managed AWS data services.

| Microservice | Data Layer                    |
| ------------ | ----------------------------- |
| 🛒 Carts     | DynamoDB                      |
| 📦 Catalog   | Amazon RDS MySQL              |
| 📋 Orders    | Amazon RDS MySQL / PostgreSQL |
| 💳 Checkout  | ElastiCache Redis + SQS       |
| 🖥️ UI       | Spring Boot                   |

This architecture separates application logic from managed persistence and messaging services.

---

# 🧪 Application & Platform Reliability

The project covers production-oriented Kubernetes patterns including:

* Health checks
* Readiness probes
* Liveness probes
* Resource requests
* Resource limits
* PodDisruptionBudgets
* Horizontal Pod Autoscaling
* Dynamic node provisioning
* Spot interruption handling
* Stateful workloads
* Persistent storage
* Secure secret management

---

# 🛠️ Technology Stack

### ☁️ Cloud

`AWS` `EKS` `EC2` `RDS` `DynamoDB` `ElastiCache` `SQS` `ECR` `Route 53` `ACM`

### 🐳 Containers

`Docker` `Docker Compose` `BuildKit` `Buildx`

### ☸️ Kubernetes

`Kubernetes` `EKS` `Ingress` `HPA` `StatefulSets` `Karpenter`

### 🏗️ Infrastructure

`Terraform` `AWS CLI`

### 📦 Packaging

`Helm`

### 🔄 DevOps

`GitHub Actions` `ArgoCD` `GitOps`

### 📊 Observability

`OpenTelemetry` `ADOT` `AWS X-Ray` `CloudWatch` `Prometheus` `Grafana`

### 💻 Application

`Java` `Spring Boot` `Node.js` `Go`

---

# 🎯 Project Objectives

The project demonstrates how to design and operate a **cloud-native production-style application platform** using modern DevOps practices.

### Key objectives

* Build containerized applications
* Provision AWS infrastructure using Terraform
* Deploy microservices on Amazon EKS
* Package applications with Helm
* Implement automated CI/CD
* Adopt GitOps with ArgoCD
* Implement Kubernetes autoscaling
* Dynamically provision compute with Karpenter
* Integrate AWS managed services
* Implement secure secret management
* Add distributed observability
* Handle Spot instance interruptions
* Build a scalable and maintainable platform

---

# 🏆 Key Highlights

| Area             | Implementation                               |
| ---------------- | -------------------------------------------- |
| ☁️ Cloud         | AWS                                          |
| ☸️ Orchestration | Amazon EKS                                   |
| 🐳 Containers    | Docker                                       |
| 🏗️ IaC          | Terraform                                    |
| 📦 Packaging     | Helm                                         |
| ⚙️ Autoscaling   | HPA + Karpenter                              |
| 🔄 CI            | GitHub Actions                               |
| 🚀 CD            | ArgoCD                                       |
| 🔐 Security      | IAM + Secrets Manager + RBAC                 |
| 🌐 Networking    | VPC + ALB + Route 53                         |
| 💾 Storage       | EBS CSI + RDS                                |
| 📊 Observability | OpenTelemetry + X-Ray + Prometheus + Grafana |
| 📨 Messaging     | SQS                                          |
| 🗃️ Data         | RDS + DynamoDB + Redis                       |

---

# 🔥 End-to-End Platform

```text
                     ┌─────────────────┐
                     │     Developer   │
                     └────────┬────────┘
                              │
                              ▼
                     ┌─────────────────┐
                     │      Git        │
                     └────────┬────────┘
                              │
                              ▼
                     ┌─────────────────┐
                     │ GitHub Actions  │
                     │       CI        │
                     └────────┬────────┘
                              │
                              ▼
                     ┌─────────────────┐
                     │      ECR        │
                     └────────┬────────┘
                              │
                              ▼
                     ┌─────────────────┐
                     │     ArgoCD      │
                     │      GitOps     │
                     └────────┬────────┘
                              │
                              ▼
                  ┌───────────────────────┐
                  │       Amazon EKS      │
                  │                       │
                  │  Helm + HPA +         │
                  │  Karpenter             │
                  │                       │
                  │  Retail Microservices │
                  └───────────┬───────────┘
                              │
             ┌────────────────┼────────────────┐
             ▼                ▼                ▼
           RDS            DynamoDB          Redis
                              │
                              ▼
                             SQS

                     Observability
                           │
                           ▼
              OpenTelemetry / X-Ray
                  / CloudWatch
                / Prometheus
                    / Grafana
```

---

# 📌 Final Result

A complete cloud-native retail platform combining:

**Infrastructure → Containers → Kubernetes → AWS → Helm → CI/CD → GitOps → Autoscaling → Security → Observability**

The result is a scalable DevOps architecture designed around modern AWS and Kubernetes practices.

---

<p align="center">
  <strong>☁️ Build • Automate • Deploy • Observe • Scale</strong>
</p>

<p align="center">
  AWS • Kubernetes • Terraform • Docker • Helm • GitHub Actions • ArgoCD • OpenTelemetry
</p>
