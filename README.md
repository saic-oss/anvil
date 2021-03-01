# Anvil

https://hub.docker.com/repository/docker/saicoss/anvil

Anvil is a DevSecOps tools container intended to drive all stages of a CI/CD pipeline. Anvil can also be used for local development, to ensure environment parity between development and build environments. Anvil is not intended to run applications in production. 

The idea is to:

1. Be able to develop your application on a computer that has nothing but an IDE and a container runtime (Docker, Podman, etc) by using Anvil as the "developer toolbox".
1. Use Anvil in your CI/CD pipeline to build, test, secure, deliver, and deploy to Kubernetes.

Anvil is very new, and many of the tools that you will need to use aren't there yet. Stay tuned, or contribute by submitting a pull request!

## What Anvil is (or will be)

- [x] A container full of tools that follows best practices for security and usability
- [ ] A Jenkins JNLP Agent
- [ ] A Selenium Server
- [ ] Maybe more???

## What Anvil is not (and never will be)

- A small container. As tools are added it is likely the container will grow to several gigabytes. This is expected and should not be seen as an issue, since this container will act as the main toolkit for developers to use to develop with.
- A container that is used to run applications in production. Don't do this! Production containers should be tiny, only installing what is absolutely necessary to run.
- A Windows container. You won't be able to build .NET Framework apps with this (.NET Core should work great though!)

## Usage

Our goal is to make Anvil as simple as possible to use. A user should be able to pick it up and use it with no required configuration.

### User Experience

The most basic way to use Anvil, is to just use `docker run`

```sh
docker run -it --rm saicoss/anvil:latest bash
```

But that's not very useful, since it doesn't have your source code, or any of your other files on your system that are necessary to get your work done. Here's a more complete example:

```sh
docker run -it --rm \
  --mount type=bind,source=$HOME/.cache,target=/home/anvil/.cache \
  --mount type=bind,source=$HOME/.ssh,target=/home/anvil/.ssh \
  --mount type=bind,source="$(pwd)",target=/home/anvil/workdir \
  --workdir /home/anvil/workdir \
  saicoss/anvil:latest \
  bash
```

Now we're talkin'! We've got a bash shell inside the container, with the current working directory, as well as $HOME/.ssh for connecting with the git repo using your SSH key, and $HOME/.cache for caching pre-commit's environments so you don't have to build them every time. This is a command that you can alias or create a shell script for in your path so you can run it easily.

For more examples of how to use tools installed in the container, see the [docs](docs) folder.

### ASDF

Anvil uses the [asdf](https://asdf-vm.com/) version manager for a lot of its tools. If you add a `.tool-versions` file to your project, you can ensure that the right version of the tools you are using are installed, regardless of what is installed by default in Anvil. Running `asdf install` will install the versions specified in your `.tool-versions` file.

## Contributing

### Requesting New Tools

To request a new tool or feature be added to Anvil, open an [Issue](https://github.com/saic-oss/anvil/issues) or [Pull Request](https://github.com/saic-oss/anvil/pulls).

### Adding and Updating Tools

To add a new tool, update an existing tool, or customize the version of a tool in use, see [the Managing Tools documentation](./docs/managingTools.md).

### Local Development and Testing

For instructions on developing and testing Anvil, see [the Development and Testing documentation](./docs/devAndTest.md).

## Tool Versions

We used to have a listing of the tools (and versions) installed in each version of Anvil, but it was too time consuming to keep up to date. Please see the [Dockerfile](./src/docker/Dockerfile) for specifications on all installed tools and versions of those tools.
