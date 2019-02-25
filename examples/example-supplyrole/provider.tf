provider "aws" {
  region  = "eu-west-1"
  version = "1.60"
}

provider "null" {
  version = "1.0"
}

provider "local" {
  version = "1.1"
}

provider "template" {
  version = "2.0"
}
