# Automation Scripts before installing any extension

## FolderStructure

This directory contains the powershell scripts and pipeline for installing any extension. The templates are organized as follows:

  ```
  sentinel-automation   
    |-- powershell
      |-- CreateContainer.ps1
      |-- StartVms.ps1
      |-- Reboot.ps1
    |-- azure-pipeline.yml
    |-- README.md
  ```

## Pipeline Requirements

The Module Package pipeline requires the following parameters to be defined
Paramaters:


| Name  | Displayname | type | Default | Values | Opional/Required | Comments |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |

| resource_group_container | Azure backend resource-group | string |  | | Required | This defines the Azure backend resource-group |
| storageAccountName | Azure location shortname of the backend storage account | string |  |  | Required | This defines the Azure location shortname of the backend storage account |
| containerName | Azure blob container to store the state file | string |  |  | Required | This defines the Azure blob container to store the state file |

  These parameters provide configuration options for the Terraform Module SentinelOne pipeline.
  


## Explanation of pipeline


### Variables in pipeline
Make sure you pass the variable inside the pipeline as below
| Name  | Value |
| ------------- | ------------- |
| subscription_id | 1f088ee6-cbc0-441e-a90a-XXXXXXXXXXXX |
| tenant_id | 42a550da-a312-4660-9b7c-XXXXXXXXXXXXXX |
| client_id | 2ce51254-9c1a-452f-b95a-XXXXXXXXXXXX |
| client_secret | 8Pv8Q~ZwsBXu721HYi2PsbHh.XXXXXXXXXXXXXXXx |

