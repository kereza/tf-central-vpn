# tf-central-vpn

This repo is part of series of personal repos where I do tests on the following topics:

1. Terraform Cloud CI/CD pipeline based on GitHub Actions for central infrastructure and release management and team collaboration
2. Managing and Deploying EKS cluster (dev and prod stages)
3. Deploying test apps on the EKS cluster (dev and prod stages)
4. Central AWS VPC (peered with PROD and DEV VPCs), used for Client VPN connection with Certificase based authentication
5. GitHub Actions running in every repo with special rules to check the Terrafrom code before merging branches (more check can be added)

This particular repo is for setting up the AWS Central Client VPN based on Certificase for authentication. If we need private connection to the VPC's in the organizations - we can use it (Of course in the real world you will probably have site-to-site VPN or even AWS Direct Connect). It setup a so called "shared VPC" which is peered with all the other VPCs in the Organization and creates the necessary routing tables and Security Groups.