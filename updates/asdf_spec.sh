#!/usr/bin/env shellspec

Describe "Check for an asdf update"
  Include ./lib_updates
  It "validates asdf is up-to-date via GitHub"
    When call getLatestGitHubTag asdf-vm/asdf
    The output should include "${ASDF_VERSION}"
    The status should eq 0
  End
End
