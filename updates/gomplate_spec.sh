#!/usr/bin/env shellspec

Describe "Check for a Gomplate update"
  Include ./lib_updates
  It "validates Gomplate is up-to-date via GitHub"
    When call getLatestGitHubTag hairyhenderson/gomplate
    The output should include "${GOMPLATE_VERSION}"
    The status should eq 0
  End
End
