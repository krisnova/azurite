# azurite

Hacky hack hack scripts for Azure, doing it right. (Also my favorite mineral)

### Create a Kubernetes cluster

##### Install jq

Use your platform's package manager to install jq.  e.g.:

```
sudo apt-get install jq
```

##### Export subscription ID

```
export AZURE_SUBSCRIPTION_ID=12345678-9abc-def0-81d5-312a06f2ffca
```

##### Create a Kubernetes cluster

```
./create <optional_cluster_name>
```

You can specify a name for the cluster if you want, or it will generate a random name for you

##### Editing your cluster config

By default your cluster config should need no changes to work, but you are welcome to specify anything you wish at this time.

##### Accessing your cluster

The cluster `config` will automatically be *appended* to `~/.kube/config`

```
kubectl get no
```
