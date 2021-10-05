#!/usr/bin/env shellspec

Describe "Check for a AWS CLI update"
  Include ./lib_updates
  It "validates AWS CLI is up-to-date via pip"
    When call getLatestVersionFromPip awscli
    The output should include "${AWS_CLI_VERSION}"
    The status should eq 0
  End
End
