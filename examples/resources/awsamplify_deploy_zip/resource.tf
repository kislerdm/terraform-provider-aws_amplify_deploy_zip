# Locatoin of the app build archive.
data "local_file" "app_archive" {
  path = "./build/app.zip"
}

# The illustratation of the app re-deployment based upon its codebase modifications.
resource "awsamplify_deploy_zip" "app" {
  # Changes of the app codebase would trigger its redeployment to AWS Amplify
  triggers = {
    hash = sha256(data.local_file.app_archive.content_base64)
  }

  # AWS Amplify Applicatino ID
  app_id = "AWSAmplifyAppID"

  # Deployment branch
  branch_name = "master"

  # Location of the zip archive with the app
  path = data.local_file.app_archive.filename
}
