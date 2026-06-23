# ☁️ GCP Fullstack CI/CD Platform

Plataforma fullstack moderna com deploy automatizado na Google Cloud Platform (GCP), utilizando CI/CD, Infrastructure as Code e containerização.

---

# 🚀 Visão Geral

Este projeto demonstra uma arquitetura completa de produção incluindo:

- Aplicação Fullstack (Frontend + Backend)
- Containerização com Docker
- Infraestrutura como Código (Terraform)
- Pipeline CI/CD com GitHub Actions
- Deploy automatizado na GCP
- Monitoramento com Google Cloud Operations Suite

---

# 🧠 Objetivo do Projeto

Simular um ambiente real de produção utilizado em empresas de tecnologia, onde:

- O código é versionado no GitHub
- O deploy é automatizado
- A infraestrutura é declarativa (IaC)
- O sistema é escalável e monitorado

---

# 🏗️ Arquitetura

```text id="architecture"
GitHub
   │
   ▼
GitHub Actions (CI/CD)
   │
   ├── Build Backend (Node.js)
   ├── Build Frontend (React)
   ├── Docker Build
   └── Push Images
        │
        ▼
Google Artifact Registry
        │
        ▼
Terraform Deploy
        │
        ├── Cloud Run (Backend)
        ├── Cloud Run (Frontend)
        ├── Cloud SQL (Database)
        └── Monitoring & Logging
        │
        ▼
Google Cloud Operations Suite
