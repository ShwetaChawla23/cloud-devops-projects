rg = {
  rg1 = {
    name     = "rg-development"
    location = "West Central US"
  }
}

vnet = {
  vnet1 = {
    name                = "dev-vnet"
    location            = "West Central US"
    resource_group_name = "rg-development"
  }
}

snet = {
  subnet1 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-development"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "dev-snet-appgw"
    resource_group_name  = "rg-development"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet3 = {
    name                 = "dev-snet-linux"
    resource_group_name  = "rg-development"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.0.3.0/24"]
  }
  subnet4 = {
    name                 = "dev-snet-win"
    resource_group_name  = "rg-development"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.0.4.0/24"]
  }
}

pip = {

  pip_bastion = {
    name                = "dev-pip-bastion"
    location            = "West Central US"
    resource_group_name = "rg-development"
  }

  pip_appgw = {
    name                = "dev-pip-appgw"
    location            = "West Central US"
    resource_group_name = "rg-development"
  }

  pip_natgw = {
    name                = "dev-pip-natgw"
    location            = "West Central US"
    resource_group_name = "rg-development"
  }
}


natgw = {

  natgw1 = {
    name                = "dev-natgw"
    location            = "West Central US"
    resource_group_name = "rg-development"
    pip_name            = "dev-pip-natgw"
    vnet_name           = "dev-vnet"
    subnet_names        = ["dev-snet-linux", "dev-snet-win"]
  }
}

nic = {
  nic_linux = {
    name                = "dev-nic-linux"
    location            = "West Central US"
    resource_group_name = "rg-development"
    vnet_name           = "dev-vnet"
    subnet_name         = "dev-snet-linux"
  }
  nic_win = {
    name                = "dev-nic-win"
    location            = "West Central US"
    resource_group_name = "rg-development"
    vnet_name           = "dev-vnet"
    subnet_name         = "dev-snet-win"
  }
}

vm = {
  nic_linux = {
    name                            = "dev-lvm"
    computer_name                   = "dev-env-lvm"
    location                        = "West Central US"
    resource_group_name             = "rg-development"
    nic_name                        = "dev-nic-linux"
    os_type                         = "linux"
    size                            = "Standard_D2s_v3"
    admin_username                  = "devadmin"
    admin_password                  = "<stored-in-azure-key-vault>"
    disable_password_authentication = false

    storage_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
    storage_os_disk = {
      name              = "dev-lvm-osdisk"
      caching           = "ReadWrite"
      managed_disk_type = "Standard_LRS"
    }
  }

  nic_win = {
    name                            = "dev-wvm"
    computer_name                   = "dev-env-wvm"
    location                        = "West Central US"
    resource_group_name             = "rg-development"
    nic_name                        = "dev-nic-win"
    os_type                         = "windows"
    size                            = "Standard_D2s_v3"
    admin_username                  = "devadmin"
    admin_password                  = "<stored-in-azure-key-vault>"
    disable_password_authentication = false

    storage_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2022-datacenter-azure-edition"
      version   = "latest"
    }
    storage_os_disk = {
      name              = "dev-wvm-osdisk"
      caching           = "ReadWrite"
      managed_disk_type = "Standard_LRS"
    }
  }
}

bastion = {
  bastion1 = {
    name                = "dev-bastion"
    location            = "West Central US"
    resource_group_name = "rg-development"
    vnet_name           = "dev-vnet"
    subnet_name         = "AzureBastionSubnet"
    pip_name            = "dev-pip-bastion"
  }
}

appgw = {
  appgw1 = {
    name                = "dev-appgw"
    location            = "West Central US"
    resource_group_name = "rg-development"
    vnet_name           = "dev-vnet"
    subnet_name         = "dev-snet-appgw"
    pip_name            = "dev-pip-appgw"
    nic_name            = "dev-nic-linux"
  }
}

key_vault = {
  kv1 = {
    key_vault_name              = "dev-env-kv-8921"
    location                    = "West Central US"
    resource_group_name         = "dev_env-rg"
    sku_name                    = "standard"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    secret_name                 = "vm-linux-secret"
  }
  kv2 = {
    key_vault_name              = "dev-env-kv-8921"
    location                    = "West Central US"
    resource_group_name         = "dev_env-rg"
    sku_name                    = "standard"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    secret_name                 = "vm-linux-secret"
  }
}







