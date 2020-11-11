# Managing Tools

## Adding New Tools

### Pinning Versions

All tools installed in Anvil (other than stable tools installed with `dnf`) should be pinned to a specific version. Version pinning ensures that Anvil will behave in a predictable and deterministic way. The specific version number of each tool should be specified using an `ARG` instruction in the [Dockerfile](../src/docker/Dockerfile). To update the pinned version of a tool, edit the `ARG` instruction that corresponds to the tool that need to be updated. For example, to update `foobar-tool` from v1.0.0 to v2.0.0, change:

```Dockerfile
ARG FOOBAR_TOOL_VERSION="1.0.0"
```

to

```Dockerfile
ARG FOOBAR_TOOL_VERSION="2.0.0"
```

### Installing a Tool

Tools are installed in Anvil by adding a new RUN command to the Dockerfile. Please use the same format and syntax that exists in the other RUN commands. Clean up any files written to temp directories at the end of the run command.

You must pin the version of the tool you are adding, and add an automated test to the `/spec` directory.

There are 3 ways to install a tool in Anvil:

1. The [DNF package manager](https://github.com/rpm-software-management/dnf)
2. The [asdf version manager](https://github.com/asdf-vm/asdf)
3. Manual installations

#### Using the DNF Package Manager

DNF is a package manager for install RPM packages. Refer to the [DNF documentation](https://dnf.readthedocs.io/en/latest/) for details on using DNF.

#### Using the asdf Version manager

asdf is a version manager for installing and managing multiple runtime versions of language tools. Refer to the [asdf documentation](https://asdf-vm.com/) for details on using asdf.

One major caveat with asdf is that when another package manager (e.g., `pip` or `gem`) is used to install a plugin or library for a language, `asdf reshim` must be run afterwards to recreate the shims for the associated package.

#### Manual Installations

Some tools are not available via a package manager. In those cases, tools can be installed manually as described in their documentation. This often involves using `wget` to download a binary artifact, or `git` to clone a repository and build from source.

### Testing Tools

Tools installed in Anvil are tested using [shellspec](https://github.com/shellspec/shellspec). When a new tool is added, a test must also be added to the test directory (`/spec/`).

## Customizing Anvil

To build a custom version of Anvil that overrides versions of specific tools, use the `--build-arg` flag. For example, to build Anvil with v0.21.0 of shellspec:

```bash
docker build src/docker -t custom-anvil:local --build-arg SHELLSPEC_VERSION=0.21.0
```

## Forking Anvil

To customize Anvil with different tools and/or versions:

1. Create a [fork](https://docs.github.com/en/free-pro-team@latest/github/getting-started-with-github/fork-a-repo) of the anvil repository
1. Change the `GROUP_NAME` and/or `IMAGE_NAME` in the [Taskfile](../Taskfile.yml)
1. Update the relevant `ARG` instructions in the [Dockerfile](../src/docker/Dockerfile)
1. Build and test the new image
1. Push the new image to a Docker repository
