#!/usr/bin/env shellspec

Describe "Check for a Shellcheck update"
  Include ./lib_updates
  It "validates Shellcheck is up-to-date via GitHub"
    When call getLatestGitHubTag koalaman/shellcheck
    The output should include "${SHELLCHECK_VERSION}"
    The status should eq 0
  End
End
