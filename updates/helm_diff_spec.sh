#!/usr/bin/env shellspec

Describe "Check for a Helm Diff update"
  Include ./lib_updates
  It "validates Helm Diff is up-to-date via GitHub"
    When call getLatestGitHubTag databus23/helm-diff
    The output should include "${HELM_DIFF_VERSION}"
    The status should eq 0
  End
End
