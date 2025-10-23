/*
Copyright 2024 The Kubernetes Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

module "secrets" {
  source  = "GoogleCloudPlatform/secret-manager/google"
  version = "~> 0.9"

  project_id = google_project.project.project_id

  secrets = [
    {
      name        = "datadog_fastly_logs_streaming"
      secret_data = "REDACT-ME"
    },
    {
      name        = "fastly_reader_sa_access_key"
      secret_data = google_storage_hmac_key.fastly_reader_key.access_id
    },
    {
      name        = "fastly_reader_sa_secret_key"
      secret_data = google_storage_hmac_key.fastly_reader_key.secret
    },
  ]
}
