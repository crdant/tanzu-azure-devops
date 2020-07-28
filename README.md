# Introduction 

A demonstration pipeline for setting up EKS cluster attached to TMC. Clusters are 
described in YAML format in [a separate repository](https://dev.azure.com/cdantonio/cluster-management/_git/clusters).
There are two collaborating pipelines: a [top-level pipeline](./pipeline.yml), and
a [child pipeline](./pipelines/cluster-maintenance.yml) that runs for each cluster 
in the [cluster repository]($/cluster-management/clusters).

# Cluster Management Steps

1. Create an EKS cluster
2. Connect cluster to the trusted registry
3. Attach that cluster to TMC
4. Configure data protection for the cluster

# Setup

## Dependencies

There are some manual dependencies for the pipeline.

### Variables

The pipeline depends on four variables you should set up when creating it:

* _keyVault_ The Azure Key Vault to use for storing Kubernetes configurations
* _trustedRegistry_ Names a Azure Container Registry registry that is considered a trusted private registry for the cluster
* _storageLocation_ Account name for a set of data protection credentials in TMC
* _tmcApiToken_ An API token for TMC that is used to attach the cluster and set up data production, this is presumed to be a secret variable

and two service connections:

* _clustermanagement_ an Azure resource management connection, right now I configure it as an owner for the subscription but at some
point I'll narrow down and document the needed parameters
* _trustedregistry_ Docker credentials to access a private registry that has the image `platform.crdant.io/tanzu-automation-toolkit:latest` available

### Toolkit Image

The pipeline depends on an image `platform.crdant.io/tanzu-automation-image` which
it presumes is in a private ACR registry. You can create the image with the 
[Dockerfile](./Dockerfile) in this repository.