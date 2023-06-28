/*
Description: If specified, will customize the "Identity"
landing zone settings.
For more information: https://github.com/Azure/terraform-azurerm-caf-enterprise-scale#input_configure_identity_resources
*/
locals {
  configure_identity_resources = {
    settings = {
      identity = {
        enabled = true
        config = {

          enable_deny_public_ip             = true
          enable_deny_rdp_from_internet     = true
          enable_deny_subnet_without_nsg    = false
          enable_deploy_azure_backup_on_vms = true
        }
      }
    }
  }
}