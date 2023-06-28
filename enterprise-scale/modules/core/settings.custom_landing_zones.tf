/*
Description: If specified, will deploy additional Management Groups
alongside Enterprise-scale core Management Groups.
Type: any
Default: {}
*/
locals {
  custom_landing_zones = {
    /*
    Can be commented on if the display name "Landing Zones" should be unnamed.
    */
    "${var.root_id}-landing-zones" = {
      display_name               = "Landing Zones"
      parent_management_group_id = "${var.root_id}"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "landing_zones"
        parameters     = {}
        access_control = {}
      }
    }

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
      subscription_ids           = [var.appLandingZone01_subscription_id, var.appLandingZone02_subscription_id]
      archetype_config = {
        archetype_id   = "empty"
        parameters     = {}
        access_control = {}
      }
    }
  }
}