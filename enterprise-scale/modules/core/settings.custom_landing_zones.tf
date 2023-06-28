# Configure the custom landing zones to deploy in
# addition to the core resource hierarchy
locals {
  custom_landing_zones = {

    "${var.root_id}-eu-hub" = {
      display_name               = "EU HUB"
      parent_management_group_id = "${var.root_id}"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "fcs-internal"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-eu-restricted" = {
      display_name               = "${upper(var.root_id)} EU Restricted"
      parent_management_group_id = "${var.root_id}-eu-hub"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "fcs-internal"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-eu-online" = {
      display_name               = "${upper(var.root_id)} EU Online"
      parent_management_group_id = "${var.root_id}-eu-hub"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "fcs_online"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-eu-customer-apps" = {
      display_name               = "${upper(var.root_id)} EU Customer Apps"
      parent_management_group_id = "${var.root_id}-eu-hub"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_apps"
        parameters     = {}
        access_control = {}
      }
    }

    "${var.root_id}-eu-hub-management" = {
      display_name               = "${upper(var.root_id)} EU Hub Management"
      parent_management_group_id = "${var.root_id}-eu-hub"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "hub_management"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-global-restricted" = {
      display_name               = "${upper(var.root_id)} Global Restricted"
      parent_management_group_id = "${var.root_id}-global-hub"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "fcs-internal"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-global-online" = {
      display_name               = "${upper(var.root_id)} Global Online"
      parent_management_group_id = "${var.root_id}-global-hub"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "fcs_online"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-global-customer-apps" = {
      display_name               = "${upper(var.root_id)} Global Customer Apps"
      parent_management_group_id = "${var.root_id}-global-hub"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_apps"
        parameters     = {}
        access_control = {}
      }
    }

    "${var.root_id}-global-hub-management" = {
      display_name               = "${upper(var.root_id)} Global Hub Management"
      parent_management_group_id = "${var.root_id}-global-hub"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "hub_management"
        parameters     = {}
        access_control = {}
      }
    }
  }
}
