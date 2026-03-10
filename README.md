# Wisecow – Containerization & Kubernetes Deployment

## Objective

This project demonstrates how to containerize and deploy the **Wisecow application** using Docker and Kubernetes, with automated CI/CD using GitHub Actions and secure TLS communication.

---

## Tech Stack

* **Node.js (Express)** – Application
* **Docker** – Containerization
* **Kubernetes** – Container orchestration
* **GitHub Actions** – CI/CD pipeline
* **Ingress + TLS** – Secure access
* **Bash & Python** – Monitoring scripts

---

## Project Structure

```
WISECOW_PROJECT
│
├── .github/workflows
│   └── ci-cd.yaml
│
├── k8s
│   ├── wisecow-deployment.yaml
│   ├── wisecow-service.yaml
│   └── wisecow-ingress.yaml
│
├── scripts
│   ├── system_health_monitor.sh
│   └── app_health_checker.py
│
├── src
│   ├── app.js
│   ├── Dockerfile
│   ├── package.json
│
├── README.md
└── .gitignore
```

---

## 1. Dockerization

The Wisecow application was containerized using Docker.

Steps implemented:

* Created a **Dockerfile** for the Node.js application
* Installed dependencies
* Exposed port **3000**
* Configured container startup command

Build image example:

```
docker build -t wisecow .
```

Run container:

```
docker run -p 3000:3000 wisecow
```

---

## 2. Kubernetes Deployment

Kubernetes manifests were created to deploy the application.

### Deployment

Defines the Wisecow application pods and replicas.

File:

```
k8s/wisecow-deployment.yaml
```

### Service

Exposes the application internally or externally.

File:

```
k8s/wisecow-service.yaml
```

### Ingress

Provides external access and TLS support.

File:

```
k8s/wisecow-ingress.yaml
```

Deploy to Kubernetes:

```
kubectl apply -f k8s/
```

---

## 3. CI/CD Pipeline (GitHub Actions)

A CI/CD workflow was created using **GitHub Actions**.

Workflow file:

```
.github/workflows/ci-cd.yaml
```

Pipeline steps:

1. Checkout repository
2. Build Docker image
3. Push image to GitHub Container Registry
4. Deploy application to Kubernetes cluster

The pipeline runs automatically whenever code is pushed to the **main branch**.

---

## 4. TLS Implementation

Secure communication is enabled using **Kubernetes Ingress with TLS**.

Features:

* HTTPS routing
* TLS secret configuration
* Secure external access to the Wisecow service

---

## 5. Monitoring Scripts (Problem Statement 2)

### System Health Monitoring Script

File:

```
scripts/system_health_monitor.sh
```

Features:

* Monitors CPU usage
* Monitors memory usage
* Monitors disk usage
* Displays alerts if usage exceeds threshold

Run:

```
./scripts/system_health_monitor.sh
```

---

### Application Health Checker

File:

```
scripts/app_health_checker.py
```

Features:

* Sends HTTP request to the application
* Checks response status code
* Reports whether the application is **UP or DOWN**

Run:

```
python3 scripts/app_health_checker.py
```

---

## End Result

* The Wisecow application is containerized using Docker.
* It is deployed on Kubernetes using deployment and service manifests.
* CI/CD automation is implemented using GitHub Actions.
* Secure TLS communication is configured via Kubernetes Ingress.
* System monitoring and application health checking scripts are implemented.

This project fulfills the requirements of the **Accuknox DevOps Trainee Practical Assessment**.
