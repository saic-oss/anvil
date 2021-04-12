# Local Development and Testing

## Prerequisites

The following steps require [go-task](https://taskfile.dev/#/) and [docker](https://docs.docker.com/get-docker/) to be installed. Please see each tool's documentation for installation instructions.

## Local development of Anvil

```bash
# Build the image
TAG=local task build

# Test the image (after building)
TAG=local task test

# Put it all together
TAG=local task build test
```

## Pre-commit

This project uses Git pre-commit hooks provided by [pre-commit](https://pre-commit.com/). Make sure you install the hooks, or the CI pipeline will fail when you try to submit a pull request

```bash
# You need Python/Pip to install pre-commit
pip install pre-commit

# Now that pre-commit is installed, install the hooks
cd your/project/directory
pre-commit install

# The hooks will now run whenever you do a git commit. To run them manually:
pre-commit run -a
```
