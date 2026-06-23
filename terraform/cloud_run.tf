resource "google_cloud_run_v2_service" "backend" {
  name     = var.backend_service_name
  location = var.region
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "${var.region}-docker.pkg.dev/${var.project_id}/${var.artifact_registry_repo}/backend:latest"

      ports {
        container_port = 8080
      }

      env {
        name  = "DB_HOST"
        value = google_sql_database_instance.postgres.public_ip_address
      }

      env {
        name  = "DB_PORT"
        value = "5432"
      }

      env {
        name  = "DB_USER"
        value = var.db_user
      }

      env {
        name  = "DB_PASSWORD"
        value = var.db_password
      }

      env {
        name  = "DB_NAME"
        value = var.db_name
      }

      env {
        name  = "DB_SSL"
        value = "false"
      }
    }
  }

  depends_on = [
    google_project_service.services,
    google_sql_database_instance.postgres,
    google_artifact_registry_repository.repo
  ]
}

resource "google_cloud_run_v2_service" "frontend" {
  name     = var.frontend_service_name
  location = var.region
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "${var.region}-docker.pkg.dev/${var.project_id}/${var.artifact_registry_repo}/frontend:latest"

      ports {
        container_port = 8080
      }
    }
  }

  depends_on = [
    google_project_service.services,
    google_artifact_registry_repository.repo,
    google_cloud_run_v2_service.backend
  ]
}

resource "google_cloud_run_service_iam_member" "backend_public" {
  service  = google_cloud_run_v2_service.backend.name
  location = var.region
  role     = "roles/run.invoker"
  member   = "allUsers"
}

resource "google_cloud_run_service_iam_member" "frontend_public" {
  service  = google_cloud_run_v2_service.frontend.name
  location = var.region
  role     = "roles/run.invoker"
  member   = "allUsers"
}
