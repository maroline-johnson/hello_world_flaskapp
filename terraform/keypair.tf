resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key-01"
  public_key = tls_private_key.rsa-key.public_key_openssh
}

resource "tls_private_key" "rsa-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "pvt_key" {
  content  = tls_private_key.rsa-key.private_key_pem
  filename = "/Users/maroline/.ssh/id_rsa"
}

resource "local_file" "pub_key" {
  content  = tls_private_key.rsa-key.public_key_openssh
  filename = "/Users/maroline/.ssh/id_rsa.pub"
}