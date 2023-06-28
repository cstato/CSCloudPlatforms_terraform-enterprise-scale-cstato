/*
Description: If specified, will deploy additional Management Groups
alongside Enterprise-scale core Management Groups.
Type: any
Default: {}
*/
locals {
  custom_landing_zones = {
    "${var.root_id}-landing-zones-corp" = {
      display_name               = "Corp"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "corp"
        parameters     = {}
        access_control = {}
      }
    }

    "${var.root_id}-landing-zones-online" = {
      display_name               = "Online"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "online"
        parameters     = {}
        access_control = {}
      }
    }

    "${var.root_id}-landing-zones-corp-prd" = {
      display_name               = "App Landing Zone Prd"
      parent_management_group_id = "${var.root_id}-landing-zones-corp"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "empty"
        parameters     = {}
        access_control = {}
      }
    }

    "${var.root_id}-landing-zones-corp-dev" = {
      display_name               = "App Landing Zone Dev"
      parent_management_group_id = "${var.root_id}-landing-zones-corp"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "empty"
        parameters     = {}
        access_control = {}
      }
    }
  }
}