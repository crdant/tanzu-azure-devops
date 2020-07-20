# Introduction 

A demonstration pipeline for setting up an EKS cluster attached to TMC.

# Pipeline Steps

1. Create an EKS cluster
2. Connect cluster to the trusted registry
3. Attach that cluster to TMC
4. Configure data protection for the cluster

## Parameters

* _clusterName_ A name for the cluster
* _resourceGroup_ The resource group into which to create the cluster, for now, we presume this is also the name of the cluster group in TMC and both should already be created
* _keyVault_ A key vault to save secrets into
* _trustedRegistry_ A private AKS registry for the cluster to access
* _backupLocation_ A backup location in TMC that backups should be sent to

# Setup

## Dependencies

There are some manual dependencies for the pipeline.

### Variables

The pipeline depends on one secret variable:

* _tmcApiToken_ An API token for TMC that is used to attach the cluster and set up data production

and two service connections:

* _clustermanagement_ an Azure resource management connection, right now I configure it as an owner for the subscription but at some
point I'll narrow down and document the needed parameters
* _trustedregistry_ Docker credentials to access a private registry that has the image `platform.crdant.io/tanzu-automation-toolkit:latest` available

### Toolkit Image

The pipeline depends on an image `platform.crdant.io/tanzu-automation-image` which
it presumes is in a private ACR registry. You can create the image with the 
[Dockerfile](./Dockerfile) in this repository.