module "codebuild" {
  source                 = "github.com/jameswoolfenden/terraform-aws-codebuild"
  projectroot            = "${var.projectroot}"
  description            = "${var.description}"
  build_timeout          = "${var.build_timeout}"
  name                   = "${var.name}"
  sourcecode             = "${var.sourcecode}"
  common_tags            = "${var.common_tags}"
  environment            = "${var.environment}"
  force_artifact_destroy = "${var.force_artifact_destroy}"
}
