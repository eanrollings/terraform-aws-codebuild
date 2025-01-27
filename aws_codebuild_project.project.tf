resource "aws_codebuild_project" "project" {
  # test is wrong
  # checkov:skip=CKV_AWS_78: "Ensure that CodeBuild Project encryption is not disabled"
  name          = replace(var.name, ".", "-")
  description   = var.description
  service_role  = var.role == "" ? element(concat(aws_iam_role.codebuild.*.arn, list("")), 0) : element(concat(data.aws_iam_role.existing.*.arn, list("")), 0)
  build_timeout = var.build_timeout

  artifacts {
    encryption_disabled = var.encryption_disabled
    location            = local.bucketname
    name                = var.name
    namespace_type      = var.artifact["namespace_type"]
    packaging           = var.artifact["packaging"]
    type                = var.artifact_type
  }

  environment {
    compute_type    = var.environment["compute_type"]
    image           = var.environment["image"]
    type            = var.environment["type"]
    privileged_mode = var.environment["privileged_mode"]
    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      value = var.environment["default_region"]
    }
    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      value = var.environment["account_id"]
    }
    environment_variable {
      name  = "IMAGE_REPO_NAME"
      value = var.environment["image_repo_name"]
    }
    environment_variable {
      name  = "IMAGE_TAG"
      value = var.environment["image_tag"]
    }
    environment_variable {
      name  = "BUILDNUMBER"
      value = "/CodeBuild/BUILDNUMBER"
      type  = "PARAMETER_STORE"
    }
  }

  source {
    type      = var.sourcecode["type"]
    location  = var.sourcecode["location"]
    buildspec = var.sourcecode["buildspec"]
  }

  source_version = var.defaultbranch

  tags = var.common_tags
}
