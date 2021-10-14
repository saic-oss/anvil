#!/usr/bin/env shellspec

Describe "Check for a Klar update"
  Include ./lib_updates
  It "validates Klar is up-to-date via GitHub"
    When call getLatestGitHubRelease optiopay/klar
    The output should include "${KLAR_VERSION}"
    The status should eq 0
  End
End
