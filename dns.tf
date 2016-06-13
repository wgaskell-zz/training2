#
# DO NOT DELETE THESE LINES!
#
# Your DNSimple email is:
#
#     sethvargo+terraform@gmail.com
#
# Your DNSimple token is:
#
#     1Gam3SE2eIwZYtq70H5V5iAXiE9sGPmf
#
# Your Identity is:
#
#     hashiconf-d67d8ab4f4c10bf22aa353e27879133c
#
provider "dnsimple" {
  email = "sethvargo+terraform@gmail.com"
  token = "1Gam3SE2eIwZYtq70H5V5iAXiE9sGPmf"
}

resource "dnsimple_record" "example" {
  domain = "terraform.rocks"
  type = "A"
  name = "gareth"
  value = "${aws_instance.web.0.public_ip}"
}
