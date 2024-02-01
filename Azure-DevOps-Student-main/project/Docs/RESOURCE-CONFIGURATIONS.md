# Resource configurations for the project exercise
_This document contains different resource configurations that is expected and required to reach different levels in the project exercise._

---
## Table of contents
1. [Function Apps](#function-apps)
2. [Storage Accounts](#storage-accounts)
3. [Recovery Services Vaults](#recovery-services-vaults)
4. [Log Analytics Workspaces](#log-analytics-workspaces)
5. [Application Insights](#application-insights)
6. [Virtual Machines](#virtual-machines)
7. [Keyvaults](#keyvaults)
8. [Private DNS Zones](#private-dns-zones)
9. [Azure Firewalls](#azure-firewalls)

---
## Function Apps

| **Level**  | **Configurations**                                                                                                                                                                                                                  |
| :--------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Level 1    | Stack - Powershell Core <br> Function for File Share service <br> Only HTTPS traffic accepted <br> Minimum TLS version 1.2                                                                                                          |                                                          
| Level 2    | Function for SFTP Service <br> Maximum Scale Out Limit set to `3` <br> Diagnostic settings sending all logs to Log Analytics and to Archive storage account <br> Function App resource connecting to Application Insights resource  |
| Level 3    | Private Endpoints for inbound traffic for the function app <br> Virtual network integration configured for outbound traffic <br> SCM-site only accessible from internal networks                                                    |
| Level 4    | Tags added for traceability back to IaC code <br> Alerts added for crucial metrics                                                                                                                                                  |
| Level 5    | _TBD_ |

---
## Storage Accounts

_Storage account used for the Function App functions_
| **Level**  | **Configurations**                                                                                                                                                                      |
| :--------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Level 1    | Only HTTPS traffic accepted <br> Minimum TLS version 1.2                                                                                                                                |                                                         
| Level 2    | Hierarchical namespace <br> Encryption scopes added for the blob containers <br> Diagnostic settings sending all logs to Log Analytics and to Archive storage account                   |
| Level 3    | Private Endpoints for all used storage account services (Blob, File & Table)                                                                                                            |
| Level 4    | Tags added for traceability back to IaC code <br> SMB protocol version 2.1 disabled for `File shares` |
| Level 5    | _TBD_ |

_Storage account used for log archiving_
| **Level**  | **Configurations**                                                                                                                                                                                                                                                 |
| :--------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Level 1    | _N/A_                                                                                                                                                                                                                                                              |                                                         
| Level 2    | Only HTTPS traffic accepted <br> Minimum TLS version 1.2 <br> Default to `Cool` access tier <br> Lifecycle Management policy for log rotation into `Archive` access tier <br> Diagnostic settings sending all logs to Log Analytics and to Archive storage account |
| Level 3    | Private Endpoints for all used storage account services (Blob) <br> Public Network access `Disabled` <br> Blob anonymous access `Disabled`                                                                                                                         |
| Level 4    | Tags added for traceability back to IaC code <br> Change Feed <br> Versioning <br> `CanNotDeleteLock` added on resource                                                                                                                                            |
| Level 5    | _TBD_ |

---
## Recovery Services Vaults

| **Level**  | **Configurations**                                                                                                  |
| :--------- | :------------------------------------------------------------------------------------------------------------------ |
| Level 1    | Tier - Standard <br> Backup policy for Azure Files <br> Retention duration set to `14` days in the backup policy    |                                                         
| Level 2    | Diagnostic settings sending all logs to Log Analytics and to Archive storage account                                |
| Level 3    | Private Endpoint for the RSV <br> Public Network access `Disabled`                                                  |
| Level 4    | Tags added for traceability back to IaC code <br> Alerts added for crucial metrics                                  |
| Level 5    | _TBD_ |

---
## Log Analytics Workspaces

| **Level**  | **Configurations**                                                                            |
| :--------- | :-------------------------------------------------------------------------------------------- |
| Level 1    | _N/A_                                                                                         |                                                         
| Level 2    | SKU set to `pergb2018`                                                                        |
| Level 3    | _N/A_                                                                                         |
| Level 4    | Tags added for traceability back to IaC code <br> `CanNotDeleteLock` added on resource        |
| Level 5    | _TBD_ |

---
## Application Insights

| **Level**  | **Configurations**                                                                            |
| :--------- | :-------------------------------------------------------------------------------------------- |
| Level 1    | _N/A_                                                                                         |                                                         
| Level 2    | IngestionMode set to `LogAnalytics`                                                           |
| Level 3    | _N/A_                                                                                         |
| Level 4    | Tags added for traceability back to IaC code <br>                                             |
| Level 5    | _TBD_ |

---
## Virtual Machines

_Management VM_
| **Level**  | **Configurations**                                                                            |
| :--------- | :-------------------------------------------------------------------------------------------- |
| Level 1    | _N/A_                                                                                         |                                                         
| Level 2    | _N/A_                                                                                         |
| Level 3    | OS-Type `Windows Server 2022 Datacenter` <br> Admin password stored in Keyvault <br> Admin password fetched from Keyvault for VM deployment <br> Only accessible on RDP from certain public IPs  |
| Level 4    | Tags added for traceability back to IaC code <br> Encryption at host <br> Public IP removed from VM <br> Default route to Azure Firewall for outbound traffic                                    |
| Level 5    | _TBD_ |


---
## Keyvaults

| **Level**  | **Configurations**                                                                                                                                          |
| :--------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Level 1    | _N/A_                                                                                                                                                       |                                                         
| Level 2    | _N/A_                                                                                                                                                       |
| Level 3    | Private Endpoint for the KV <br> Public Network access `Disabled` <br> Diagnostic settings sending all logs to Log Analytics and to Archive storage account |
| Level 4    | Tags added for traceability back to IaC code <br> Alerts added for crucial metrics |
| Level 5    | _TBD_ |

---
## Private DNS Zones
| **Level**  | **Configurations**                                                                                                                                          |
| :--------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Level 1    | _N/A_                                                                                                                                                       |                                                         
| Level 2    | _N/A_                                                                                                                                                       |
| Level 3    | `CanNotDeleteLock` added on SOA records           |
| Level 4    | Tags added for traceability back to IaC code <br> |
| Level 5    | _TBD_ |

---
## Azure Firewalls
| **Level**  | **Configurations**                                                                                                                                          |
| :--------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Level 1    | _N/A_                                                                                                                                                       |                                                         
| Level 2    | _N/A_                                                                                                                                                       |
| Level 3    | _N/A_                                                                                                                                                                                                                                                                 |
| Level 4    | Tags added for traceability back to IaC code <br> Threat Intelligence set to at least `Alert Only` <br> DNAT & Network Rules to reach _Management VM_ on RDP port `3389` inbound <br> Diagnostic settings sending all logs to Log Analytics and to Archive storage account <br> `CanNotDeleteLock` added on resource <br> Alerts added for crucial metrics  |
| Level 5    | _TBD_ |
