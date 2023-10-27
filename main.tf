module "s3" {
  source = "./modules/s3"
  bucket = "jerrii.xmasterofterra"
  tags = {
    Name        = "luffy"
    Environment = "dev"
  }
}

module "s3_cors" {
  source = "./modules/s3_cors"
  bucket = "jerrii.xmasterofterra"
}

module "s3_policy" {
  source   = "./modules/s3_policy"
  bucket   = "jerrii.xmasterofterra"
  username = "cloud_user"
}