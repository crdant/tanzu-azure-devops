# Introduction 

A demonstration pipeline for setting up an EKS cluster attached to TMC.

# Pipeline Steps

1. Create an EKS cluster
2. Connect cluster to the trusted registry
3. Attach that cluster to TMC
4. Configure data protection for the cluster

# Toolkit Image

The pipeline depends on an image `platform.crdant.io/tanzu-automation-image` which
it presumes is in a private ACR registry. You can create the image with the 
[Dockerfile](./Dockerfile) in this repository.