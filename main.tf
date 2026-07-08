provider "oci" {}

resource "oci_core_instance" "generated_oci_core_instance" {
	agent_config {
		is_management_disabled = "false"
		is_monitoring_disabled = "false"
		plugins_config {
			desired_state = "DISABLED"
			name = "Vulnerability Scanning"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "OS Management Hub Agent"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Management Agent"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Custom Logs Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute RDMA GPU Monitoring"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Auto-Configuration"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Authentication"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Cloud Guard Workload Protection"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Block Volume Management"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Bastion"
		}
	}
	availability_config {
		recovery_action = "RESTORE_INSTANCE"
	}
	availability_domain = "DVzH:AP-MUMBAI-1-AD-1"
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaa643j46qy375iliic4smv6gfo64ilkhipgpfq5bwhsuucsxwk57pq"
	create_vnic_details {
		assign_ipv6ip = "false"
		assign_private_dns_record = "true"
		assign_public_ip = "false"
		display_name = "main-vnic"
		subnet_id = "${oci_core_subnet.generated_oci_core_subnet.id}"
	}
	display_name = "Sweetjuice"
	instance_options {
		are_legacy_imds_endpoints_disabled = "true"
	}
	is_pv_encryption_in_transit_enabled = "true"
	metadata = {
		"ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRF/Ze0O49m46WSHOSkD300R4Aqth0CLZS3A8lo6SO/hnryT0LYDo14o1cqt6UuH89N4de0wFagFcF0cQz0fm5N9ihKxQQpoYnx8S0g9ar3zPMrdnz/jS+VG2jsneEh+iHClP/HfFFp1+mCSZSZ/cFquuSg3PwteSuOqSYBtio54iEKR/0CEPg1phKGG9vYoueKCOT+xBT4mdOsiwg0ABhGZrcdobOY4y97+M6idnM3ogni4Xu2UeA4yvHrC0lQqq49yYi+xvDJPg2eCMHmzHbwOyfIqY2vD6cbf2h8m+SzIwa4b1DMAx8wJgu+w3e1h4D4BMAEGMiFL7vRXhBkRox ssh-key-2026-04-04"
	}
	shape = "VM.Standard.A1.Flex"
	shape_config {
		memory_in_gbs = "24"
		ocpus = "4"
	}
	source_details {
		boot_volume_size_in_gbs = "200"
		boot_volume_vpus_per_gb = "10"
		source_id = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaa2op2x2s5rnduo5osx6zojr526qxtrvhddkdhks5nllbwjzcylwya"
		source_type = "image"
	}
}

resource "oci_core_vcn" "generated_oci_core_vcn" {
	cidr_block = "10.0.0.0/16"
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaa643j46qy375iliic4smv6gfo64ilkhipgpfq5bwhsuucsxwk57pq"
	display_name = "main-vnic"
	dns_label = "vcn07081426"
}

resource "oci_core_subnet" "generated_oci_core_subnet" {
	cidr_block = "10.0.0.0/24"
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaa643j46qy375iliic4smv6gfo64ilkhipgpfq5bwhsuucsxwk57pq"
	display_name = "subnet-20260708-1413"
	dns_label = "subnet07081426"
	route_table_id = "${oci_core_vcn.generated_oci_core_vcn.default_route_table_id}"
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}

resource "oci_core_internet_gateway" "generated_oci_core_internet_gateway" {
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaa643j46qy375iliic4smv6gfo64ilkhipgpfq5bwhsuucsxwk57pq"
	display_name = "Internet Gateway main-vnic"
	enabled = "true"
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}

resource "oci_core_default_route_table" "generated_oci_core_default_route_table" {
	route_rules {
		destination = "0.0.0.0/0"
		destination_type = "CIDR_BLOCK"
		network_entity_id = "${oci_core_internet_gateway.generated_oci_core_internet_gateway.id}"
	}
	manage_default_resource_id = "${oci_core_vcn.generated_oci_core_vcn.default_route_table_id}"
}
