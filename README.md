# azurite

This repository is a hodge-podge collection of `bash` glue and ceiling wax that helps me (and nobody else) hack away at Azure.

There is nothing of importance to be found here.

Go away.

This will never be supported.

Ever.

Especially not on Windows.

### Launching A Kubernetes cluster in Azure

```bash
cd azurite
export AZURITE_PUBLIC_KEY="${HOME}/.ssh/id_rsa.pub"
export AZURITE_PREFIX="k8s"
export AZURITE_STATE_STORE="${HOME}/azure-templates"
export AZURITE_LOCATION="eastus"
./create
```


