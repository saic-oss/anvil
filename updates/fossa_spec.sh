#!/usr/bin/env shellspec

Describe "Check for a Fossa update"
  Include ./lib_updates
  It "validates Fossa is up-to-date via GitHub"
    When call getLatestGitHubRelease fossas/fossa-cli
    The output should include "${FOSSA_VERSION}"
    The status should eq 0
  End
End
