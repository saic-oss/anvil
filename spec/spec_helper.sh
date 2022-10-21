#!/usr/bin/env shellspec

set -eu

spec_helper_precheck() {
  minimum_version "0.28.1"
  if [ "$SHELL_TYPE" != "bash" ]; then
    abort "Only bash is supported."
  fi
}
