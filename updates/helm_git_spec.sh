#!/usr/bin/env shellspec

Describe "Check for a Helm Git update"
  Include ./lib_updates
  It "validates Helm Git is up-to-date via GitHub"
    When call getLatestGitHubTag aslafy-z/helm-git
    The output should include "${HELM_GIT_VERSION}"
    The status should eq 0
  End
End
