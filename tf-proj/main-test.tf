terraform {
  required_providers {
    buildkite = {
      source  = "buildkite/buildkite"
      version = "~> 1.0"
    }
  }
}

# Configure the Buildkite Provider
provider "buildkite" {
  # Use the `BUILDKITE_API_TOKEN` environment variable so the token is not committed
  api_token = "bkua_63fa9fec9d119f650e8b00a2b5f0c5c20036cc65" # can also be set from env: BUILDKITE_API_TOKEN
  organization = "atte-test-org-1" # can also be set from env: BUILDKITE_ORGANIZATION_SLUG
}

# Add a pipeline
resource "buildkite_pipeline" "pipeline" {
  name       = "repo_test"
  repository = "git@github.com:stephanieatte/test-repo.git"

  provider_settings = {
     trigger_mode        = "none"
  }
}
