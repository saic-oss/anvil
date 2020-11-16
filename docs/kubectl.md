# kubectl

## Developer Experience

The simplest way to use kubectl is to just mount the `$HOME/.kube` directory in the container.

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
