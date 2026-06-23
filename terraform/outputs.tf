output "backend_url" {
  value = google_cloud_run_v2_service.backend.uri
}

output "frontend_url" {
  value = google_cloud_run_v2_service.frontend.uri
}

output "cloud_sql_public_ip" {
  value = google_sql_database_instance.postgres.public_ip_address
}
