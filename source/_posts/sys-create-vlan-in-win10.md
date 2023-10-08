---
title: Create VLAN Interface in Win10 
date: 2023-08-07 13:58:49
tags:
    - VLAN
    - WIN
---
Run your power shell with admin 

NOTE: All the test is basd on USB ASIX AX88179A USB Ethernet adapter
# Create Virtual Switch

```bash
New-VMSwitch -name VS0 -NetAdapterName DLINK100 -AllowManagementOS $false
```

# Create Virtual Interface
We can add more virtual interfaces on each virtual switch
## Add iface and set mac
```bash
Add-VMNetworkAdapter -Switch VS0 -ManagementOS -Name "DLINK_V45" -StaticMacAddress 02-04-00-00-00-22

```
## Set VLAN ID

```bash
Set-VMNetworkAdapterVlan -ManagementOS -VMNetworkAdapterName "DLINK_V45" -Access -VlanID 45
```

# Management comand

## Get all virtual switch 
```bash
get-vmnetworkadapter -managementos

Name                   IsManagementOs VMName SwitchName     MacAddress   Status IPAddresses
----                   -------------- ------ ----------     ----------   ------ -----------
Container NIC 63053bc9 True                  Default Switch 00155D870D43 {Ok}
DLINK_V45              True                  VS0            020600000022 {Ok}
```

## Delete virtual interface
```bash
remove-vmnetworkadapter -managementos -name "DLINK_V45"
```
## Check status of virtual interface

```bash
Get-VMNetworkAdapterVlan -ManagementOS -VMNetworkAdapterName "DLINK_V45"

VMName VMNetworkAdapterName Mode   VlanList
------ -------------------- ----   --------
       DLINK_V45            Access 45
```

## Delete Virtual Switch
```bash
Remove-VMSwitch -name "VS0" -Force -Confirm
```


# Whole flow 
## Add All
```bash
New-VMSwitch -name VS0 -NetAdapterName DLINK100 -AllowManagementOS $false
Add-VMNetworkAdapter -Switch VS0 -ManagementOS -Name "VLAN45" -StaticMacAddress 02-04-00-00-00-22
Set-VMNetworkAdapterVlan -ManagementOS -VMNetworkAdapterName "VLAN45" -Access -VlanID 45

Add-VMNetworkAdapter -Switch VS0 -ManagementOS -Name "VLAN65" -StaticMacAddress 02-04-00-00-00-44
Set-VMNetworkAdapterVlan -ManagementOS -VMNetworkAdapterName "VLAN65" -Access -VlanID 65

Get-VMNetworkAdapterVlan -ManagementOS
get-vmnetworkadapter -managementos


#OR
New-VMSwitch -name VS0 -NetAdapterName ASIX1000 -AllowManagementOS $true
Add-VMNetworkAdapter -Switch VS0 -ManagementOS -Name "VLAN45" -StaticMacAddress 02-04-00-00-00-22
Set-VMNetworkAdapterVlan -ManagementOS -VMNetworkAdapterName "VLAN45" -Access -VlanID 45
Get-VMNetworkAdapterVlan -ManagementOS
get-vmnetworkadapter -managementos

New-VMSwitch -name VS0 -NetAdapterName Ethernet -AllowManagementOS $false

Add-VMNetworkAdapter -Switch VS0 -ManagementOS -Name "VLAN45" -StaticMacAddress 02-04-00-00-00-22
Set-VMNetworkAdapterVlan -ManagementOS -VMNetworkAdapterName "VLAN45" -Access -VlanID 45
Add-VMNetworkAdapter -Switch VS0 -ManagementOS -Name "TRUNK" -StaticMacAddress 02-04-00-00-00-33
Set-VMNetworkAdapterVlan -ManagementOS -VMNetworkAdapterName "TRUNK"  -Trunk -AllowedVlanIdList 2-100 -NativeVlanId 1
Get-VMNetworkAdapterVlan -ManagementOS
get-vmnetworkadapter -managementos


Add-VMNetworkAdapter -Switch VS1 -ManagementOS -Name "TRUNK" -StaticMacAddress 02-04-00-00-00-33
Set-VMNetworkAdapterVlan -ManagementOS -VMNetworkAdapterName "TRUNK"  -Trunk -AllowedVlanIdList 1-4094 -NativeVlanId 1



Add-VMNetworkAdapter -Switch VS1 -ManagementOS -Name "VLAN45" -StaticMacAddress 02-04-00-00-00-22
Set-VMNetworkAdapterVlan -ManagementOS -VMNetworkAdapterName "VLAN45" -Access -VlanID 45

```

## Check all
```bash
Get-VMNetworkAdapterVlan -ManagementOS
Get-VMNetworkAdapterVlan -ManagementOS -VMNetworkAdapterName "VLAN45"
get-vmnetworkadapter -managementos

```

## Delete ALL
```bash
remove-vmnetworkadapter -managementos -name "VLAN45"
remove-vmnetworkadapter -managementos -name "TRUNK"
Remove-VMSwitch -name "VS0" -Force

```