resource "aws_iam_role_policy" "codecommit_policy" {
  name  = "codecommitpolicy-${var.name}-${var.env}"
  count = "${var.reponame == "" ? 0 : 1}"
  role  = "${aws_iam_role.codebuild.id}"

  policy = <<JSON
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "codecommit:GetTree",
                "codecommit:ListPullRequests",
                "codecommit:GetBlob",
                "codecommit:GetReferences",
                "codecommit:GetCommentsForComparedCommit",
                "codecommit:GetCommit",
                "codecommit:GetComment",
                "codecommit:GetCommitHistory",
                "codecommit:GetCommitsFromMergeBase",
                "codecommit:DescribePullRequestEvents",
                "codecommit:GetPullRequest",
                "codecommit:ListBranches",
                "codecommit:GetRepositoryTriggers",
                "codecommit:GitPull",
                "codecommit:BatchGetRepositories",
                "codecommit:GetCommentsForPullRequest",
                "codecommit:GetObjectIdentifier",
                "codecommit:CancelUploadArchive",
                "codecommit:GetFolder",
                "codecommit:BatchGetPullRequests",
                "codecommit:GetFile",
                "codecommit:GetUploadArchiveStatus",
                "codecommit:GetDifferences",
                "codecommit:GetRepository",
                "codecommit:GetBranch",
                "codecommit:GetMergeConflicts"
            ],
            "Resource": "arn:aws:codecommit:${var.region}:${data.aws_caller_identity.current.account_id}:${var.reponame}"
        }
    ]
}
JSON
}