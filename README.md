# CI/CD (yaml) of the Weight Tracker app 

![Alt text](./assets/project-cicd.png "Rpoject overview")

**Requirements:**

* [Azure DevOps account](https://dev.azure.com/)
* Azure DevOps project

## Configuration
1. Create a new pipeline usinf the clone of this repository (GitHub). Select an existing YAML file: azure-pipelines.yml.
2. Create 2 Environments (For the deployment stages). Select Linux machine and install on the Ansible VM using the installation guide on the screen.
3. Set the production environment to be apporavl required.
4. Set the Environment Variable groups (one for Production and one for Staging). Set the group permission to be available to the pipeline.
![Alt text](./assets/production_vars.jpg "config vars")
4. Create an Agent pool in the project settings. In this yaml file, it is referenced as 'my-pool'.
