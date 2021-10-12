#!/usr/bin/env shellspec

Describe "Check for a Pipenv update"
  Include ./lib_updates
  It "validates Pipenv is up-to-date via pip"
    When call getLatestVersionFromPip pipenv
    The output should include "${PIPENV_VERSION}"
    The status should eq 0
  End
End
