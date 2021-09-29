#!/usr/bin/env shellspec

Describe "Check for an update to Pipenv"
  Include ./lib_updates
  It "validates tool is up-to-date by checking for an update"
    When call checkForPipUpdate pipenv
    The status should not eq 0
  End
End
