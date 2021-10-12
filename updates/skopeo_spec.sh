#!/usr/bin/env shellspec

Describe "Check for Skopeo update"
  Include ./lib_updates
  It "checks DNF update list for Skopeo"
    When call checkForDnfUpdate skopeo.x86_64
    The status should not eq 0
  End
End
