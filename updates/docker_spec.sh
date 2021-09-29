#!/usr/bin/env shellspec

Describe "Check for an update to Docker"
  Include ./lib_updates
  It "validates tool is up-to-date by checking for an update"
    When call checkForDnfUpdate docker-ce.x86_64
    The status should not eq 0
  End
End
