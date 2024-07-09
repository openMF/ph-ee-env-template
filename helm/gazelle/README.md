# helm charts for use with and by Mifos-Gazelle deployments
This chart is based on the g2p-sandbox or at least uses it as a starting point for a purpose built chart for PHEE that 
will work with the mifos-gazelle deloyment tools 

## Usage: this chart is designed to be deployed from mifos-gazelle 
=> please refer to the mifos-gazelle readme at *TBD* for instructions on deploying and interacting

## Notes
- initially the target platform for this chart is a single node kubernetes cluster running on an Ubuntu VM and the values.yaml files  will reflect this.
- it is a design goal however to facilitate growing from a single cluster for POCs to full scale deployments on the most popular kubernetes engines such as AWS EKS, Azure AKS, Oracle OCI OKE etc 
- this chart and the mifos-gazelle tools that deploy it may/will/do currently depend upon the c4gt-gazelle-dev branch of the ph-ee-template repo 