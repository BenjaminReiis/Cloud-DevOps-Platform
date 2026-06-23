resource "google_monitoring_uptime_check_config" "frontend_uptime" {
  display_name = "frontend-uptime-check"
  timeout      = "10s"
  period       = "60s"

  http_check {
    path = "/"
    port = 443
    use_ssl = true
  }

  monitored_resource {
    type = "uptime_url"
    labels = {
      host = replace(replace(google_cloud_run_v2_service.frontend.uri, "https://", ""), "/", "")
    }
  }

  depends_on = [google_cloud_run_v2_service.frontend]
}

resource "google_monitoring_notification_channel" "email" {
  display_name = "Email Alerts"
  type         = "email"

  labels = {
    email_address = "seu-email@empresa.com"
  }
}

resource "google_monitoring_alert_policy" "frontend_uptime_alert" {
  display_name = "Frontend Uptime Alert"
  combiner     = "OR"

  conditions {
    display_name = "Frontend indisponivel"

    condition_threshold {
      filter          = "metric.type=\"monitoring.googleapis.com/uptime_check/check_passed\" AND resource.type=\"uptime_url\""
      duration        = "120s"
      comparison      = "COMPARISON_LT"
      threshold_value = 1

      aggregations {
        alignment_period   = "120s"
        per_series_aligner = "ALIGN_NEXT_OLDER"
      }
    }
  }

  notification_channels = [google_monitoring_notification_channel.email.id]

  alert_strategy {
    auto_close = "1800s"
  }

  depends_on = [google_monitoring_uptime_check_config.frontend_uptime]
}
