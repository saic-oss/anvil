#!/usr/bin/env shellspec

Describe "Check for a Hadolint update"
  Include ./lib_updates
  It "validates Hadolint is up-to-date via GitHub"
    When call getLatestGitHubTag hadolint/hadolint
    The output should include "${HADOLINT_VERSION}"
    The status should eq 0
  End
End
