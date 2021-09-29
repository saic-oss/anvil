#!/usr/bin/env shellspec

Describe "Check for Node.js update"
Include ./lib_updates
  It "validates tool is up-to-date by checking for an update"
    When call getLatestVersionFromAsdf nodejs
    The output should include "${NODEJS_VERSION}"
    The status should eq 0
  End
End
