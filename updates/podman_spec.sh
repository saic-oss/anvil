#!/usr/bin/env shellspec

Describe "Check for Podman update"
  Include ./lib_updates
  It "gets the latest version of Docker"
    When call checkForDnfUpdate podman.x86_64
    The status should not eq 0
  End
End
