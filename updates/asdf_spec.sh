#!/usr/bin/env shellspec

Describe "Check for an update to asdf"
  Include ./lib_updates
  It "validates tool is up-to-date by checking for an update"
    When call getLatestGitHubTag asdf-vm/asdf
    The output should include "${ASDF_VERSION}"
    The status should eq 0
  End
End
