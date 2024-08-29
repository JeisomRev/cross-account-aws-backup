provider "aws" {
  region = "us-west-2"
  alias  = "source"
}

provider "aws" {
  region = "us-west-2"
  alias  = "destination1"
}