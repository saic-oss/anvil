#!/usr/bin/env shellspec

Describe "Check for update to Shellspec"
  Include ./lib_updates
  It "validates Shellspec is up-to-date via GitHub"
    When call getLatestGitHubRelease shellspec/shellspec
    The output should include "${SHELLSPEC_VERSION}"
    The status should eq 0
  End
End
