provider "openstack" {
  user_name = "vallard"  
}

resource "openstack_compute_instance_v2" "test-server" {
  name = "tf-test"
  image_id = "bc3c7ad4-33d5-4702-a01a-b4b65b5c14a3"
  region = "RegionOne"
  flavor_id = "5"
  metadata {
    this = "that"
  }
  key_pair = "tco-gold"
  security_groups = ["default"]
  user_data = "${file('startmining.sh')}"
}
