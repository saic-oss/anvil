# AWS CLI

## Developer Experience

The simplest way to use AWS CLI is to just mount the `$HOME/.aws` directory in the container.

```sh
docker run -it --rm \
  --mount type=bind,source=$HOME/.cache,target=/home/anvil/.cache \
  --mount type=bind,source=$HOME/.ssh,target=/home/anvil/.ssh \
  --mount type=bind,source="$(pwd)",target=/home/anvil/workdir \
  --mount type=bind,source=$HOME/.aws,target=/home/anvil/.aws \
  --workdir /home/anvil/workdir \
  saicoss/anvil:latest \
  bash
```

This will let you use AWS CLI with your host's profiles and credentials. **This way is not secure**. Your credentials are stored unencrypted in \$HOME/.aws/credentials.

Instead, install [aws-vault](https://github.com/99designs/aws-vault) on your system, and use it to pass temporary credentials into the container for aws-cli to use.

```sh
# Store AWS credentials for the "home" profile
$ aws-vault add home
Enter Access Key Id: ABDCDEFDASDASF
Enter Secret Key: %%%

aws-vault exec home -- docker run -it --rm \
  -e AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY \
  -e AWS_SESSION_TOKEN \
  -e AWS_SECURITY_TOKEN \
  --mount type=bind,source="$HOME"/.cache,target=/home/anvil/.cache \
  --mount type=bind,source="$HOME"/.ssh,target=/home/anvil/.ssh \
  --mount type=bind,source="$(pwd)",target=/home/anvil/workdir \
  --workdir /home/anvil/workdir \
  saicoss/anvil:latest \
  bash
```
