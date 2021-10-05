#!/usr/bin/env shellspec

Describe "Check for a Helm S3 update"
  Include ./lib_updates
  It "validates Helm S3 is up-to-date via GitHub"
    When call getLatestGitHubTag hypnoglow/helm-s3
    The output should include "${HELM_S3_VERSION}"
    The status should eq 0
  End
End
