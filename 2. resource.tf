resource "aws_ebs_volume" "example_volume" {
  provider          = aws.source
  availability_zone = "us-west-2a"
  size              = 8             
  type              = "gp2"         
  tags = {
    Name = "FreeTierEBSVolume"
  }
}