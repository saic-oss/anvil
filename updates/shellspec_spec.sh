#!/usr/bin/env shellspec

Describe "Check for update to ShellSpec"
  Include ./lib_updates
  It "validates tool is up-to-date by checking for an update"
    When call getLatestGitHubRelease shellspec/shellspec
    The output should include "${SHELLSPEC_VERSION}"
    The status should eq 0
  End
End
