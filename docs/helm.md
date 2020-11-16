# helm

## helm plugins

- [helm-diff](https://github.com/databus23/helm-diff)

## Other

- [helmfile](https://github.com/roboll/helmfile)

## Developer Experience

### Setup

The simplest way to use helm is to just mount the `$HOME/.kube` directory in the container.

Start the docker image:

```sh
docker run -it --rm \
  --mount type=bind,source=$HOME/.cache,target=/home/anvil/.cache \
  --mount type=bind,source=$HOME/.ssh,target=/home/anvil/.ssh \
  --mount type=bind,source="$(pwd)",target=/home/anvil/workdir \
  --mount type=bind,source=$HOME/.kube,target=/home/anvil/.kube \
  --workdir /home/anvil/workdir \
  saicoss/anvil:latest \
  bash
```

### helm 3

Inside the Docker container you can use:

```sh
helm list -a --all-namespaces
helm repo add stable http://storage.googleapis.com/kubernetes-charts-stable
```
