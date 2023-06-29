locals {
  /*
  Description: Used to tune terraform apply when faced with errors caused
  by API caching or eventual consistency. Sets a custom delay period after
  creation of the specified resource type.
  Type: string
  Default: {
    azurerm_management_group      = "30s",
    azurerm_policy_assignment     = "30s",
    azurerm_policy_definition     = "30s",
    azurerm_policy_set_definition = "30s",
    azurerm_role_assignment       = "0s",
    azurerm_role_definition       = "60s"
  }
  */
  create_duration_delay = {
    azurerm_management_group      = "30s",
    azurerm_policy_assignment     = "30s",
    azurerm_policy_definition     = "30s",
    azurerm_policy_set_definition = "30s",
    azurerm_role_assignment       = "0s",
    azurerm_role_definition       = "60s"
  }


  /*
  Description: If specified, the custom_policy_roles variable overrides which
  Role Definition ID(s) (value) to assign for Policy Assignments with a Managed
  Identity, if the assigned "policyDefinitionId" (key) is included in this variable.
  Type: map(list(string))
  Default: {}
  */
  custom_policy_roles = {}


  /*
  Description: If specified, will set custom Archetype configurations for the core
  ALZ Management Groups. Does not work for management groups specified by the
  'custom_landing_zones' input variable.
  Type: any
  Default: {}
  */
  archetype_config_overrides = {
  Tamer = {
    archetype_id = "es_platform"
    parameters = {
      Deny-Subnet-Without-Nsg = {
        effect = "Audit"
      }
    }
    access_control = {}
  }


  /*
  Description: If specified, will set the default tags for all resources deployed
  by this module where supported.
  Type: map(string)
  Default: {}
  */
  default_tags = {}


  /*
  Description: If set to true, will enable the "Connectivity" landing zone settings
  and add "Connectivity" resources into the current Subscription context.
  Type: bool
  Default: false
  */
  deploy_connectivity_resources = false

}
