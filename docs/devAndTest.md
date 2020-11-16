# Local Development and Testing

## Prerequisites

The following steps require [go-task](https://taskfile.dev/#/) and [docker](https://docs.docker.com/get-docker/) to be installed. Please see each tool's documentation for installation instructions.

## Build

To build the Anvil container locally, run the command:

```bash
ANVIL_TAG=local task build
```

This will build the container and tag it as `saicoss/anvil:local`.

## Test

To test the Anvil container locally, run the command:

```bash
ANVIL_TAG=local task test
```

## Run

To start an interactive shell, run the command:

```bash
ANVIL_TAG=local task run
```
