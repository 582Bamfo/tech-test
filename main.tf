module "image" {
  source = "./image"
}

module "static_web" {
  source = "./static_web_bucket"
}


module "temp" {
  source = "./temp"
}