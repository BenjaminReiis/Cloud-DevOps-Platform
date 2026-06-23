variable "project_id" {
  description = "ID do projeto GCP"
  type        = string
}

variable "region" {
  description = "Regiao GCP"
  type        = string
  default     = "us-central1"
}

variable "backend_service_name" {
  description = "Nome do servico backend"
  type        = string
  default     = "backend-service"
}

variable "frontend_service_name" {
  description = "Nome do servico frontend"
  type        = string
  default     = "frontend-service"
}

variable "artifact_registry_repo" {
  description = "Nome do repositorio Artifact Registry"
  type        = string
  default     = "app-images"
}

variable "db_name" {
  description = "Nome do banco"
  type        = string
  default     = "appdb"
}

variable "db_user" {
  description = "Usuario do banco"
  type        = string
  default     = "appuser"
}

variable "db_password" {
  description = "Senha do banco"
  type        = string
  sensitive   = true
}

variable "github_owner" {
  description = "Owner do GitHub"
  type        = string
}

variable "github_repo" {
  description = "Nome do repositorio GitHub"
  type        = string
}
