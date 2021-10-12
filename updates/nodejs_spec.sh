#!/usr/bin/env shellspec

Describe "Check for Node update"
  Include ./lib_updates
  It "validates Node is up-to-date via asdf"
    When call getLatestVersionFromAsdf nodejs
    The output should include "${NODEJS_VERSION}"
    The status should eq 0
  End
End
