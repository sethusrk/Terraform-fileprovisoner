data "aws_ami" "amlin" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.6.20241031.0-kernel-6.1-x86_64"]
  }
}