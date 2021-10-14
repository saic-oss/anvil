#!/usr/bin/env shellspec

Describe "Check for a Docker update"
  Include ./lib_updates
  It "checks DNF update list for Docker"
    When call checkForDnfUpdate docker-ce.x86_64
    The status should not eq 0
  End
End
