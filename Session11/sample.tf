data "azurerm_subnet" "backends_subnet" {
  count = var.enable_subnet ? 1 : 0
  name                 = var.virtual_network_subnet_name
  virtual_network_name = var.virtual_network
  resource_group_name  = var.virtual_network_resource_group
  
}



resource "azurerm_redis_cache" "rc" {

  name = replace(
    format("%s%s%03d",
      lower(substr(
        module.naming.redis_cache.name, 0, 
        module.naming.redis_cache.max_length - 4
      )),
      lower(substr(title(var.info.environment), 0, 1)),
      title(var.info.sequence)
    ), "redis", "rc"
  )
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = var.capacity 
  family              = var.family
  sku_name            = var.sku
  enable_non_ssl_port = false #defaulted
  minimum_tls_version = var.minimum_tls_version
  subnet_id           = var.enable_subnet ? data.azurerm_subnet.backends_subnet[0].id : null

  tags = local.merged_tags

  redis_configuration {
  }    
}


resource "azurerm_redis_firewall_rule" "firewall" {
 
 for_each = {
    for index, attribute in var.firewall_rules: index => attribute
  }
  
  name                = each.value.firewall_rule_name
  redis_cache_name    = azurerm_redis_cache.rc.name
  resource_group_name = var.resource_group_name
  start_ip            = each.value.firewall_start_ip
  end_ip              = each.value.firewall_end_ip
  
 
}

firewall_rules = [
    { 
    firewall_rule_name = "myip"
    firewall_start_ip  = "192.168.5.7"
    firewall_end_ip    = "192.168.5.7"
    },
    { 
    firewall_rule_name = "mylaptop_ip"
    firewall_start_ip  = "192.168.6.7"
    firewall_end_ip    = "192.168.6.7"
    }
    ]

variable "firewall_rules" {
  type = list(object({
    firewall_rule_name = string
    firewall_start_ip  = string
    firewall_end_ip    = string
  }))
  default = []
}



reserved = var.kind == "Linux" ? true : var.reserved


app_service_environment_id = var.app_service_environment_enabled? data.azurerm_app_service_environment.ase[0].id : null


dynamic rule {

for_each = var.rules

content {

metric_trigger {

metric_name        = rule.value.metric_trigger.metric_name

metric_resource_id = azurerm_app_service_plan.app_service_plan.id

time_grain         = rule.value.metric_trigger.time_grain

statistic          = rule.value.metric_trigger.statistic

time_window        = rule.value.metric_trigger.time_window

time_aggregation   = rule.value.metric_trigger.time_aggregation

operator           = rule.value.metric_trigger.operator

threshold          = rule.value.metric_trigger.threshold

}

scale_action {

direction = rule.value.scale_action.direction

type      = rule.value.scale_action.type

value     = rule.value.scale_action.value

cooldown  = rule.value.scale_action.cooldown

}

}

}

rules = {
    metric_trigger {
        specification =
        cpu           =
    }
    scale_action {
        cooldown = 

    }
}
