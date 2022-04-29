nsg_rules = [{
  access                     = "Allow"
  priority                   = 110
  direction                  = "Inbound"
  source_port_range          = "*"
  destination_port_range     = "80"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  protocol                   = "Tcp"
  name                       = "AllowHTTP"
  },
  { access                     = "Allow"
    name                       = "AllowHTTPS"
    priority                   = 120
    direction                  = "Inbound"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    protocol                   = "Tcp"
  },
  { access                     = "Allow"
    name                       = "AllowSSH"
    priority                   = 130
    direction                  = "Inbound"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  protocol = "Tcp" },

  { access                     = "Allow"
    name                       = "AllowRDP"
    priority                   = 140
    direction                  = "Inbound"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  protocol = "Tcp" }

]

