#!/usr/bin/env shellspec

Describe "Check for Serverless update"
  Include ./lib_updates
  It "validates Serverless is up-to-date via npm"
    When call getLatestVersionFromNpm serverless
    The output should include "${SERVERLESS_VERSION}"
    The status should eq 0
  End
End
