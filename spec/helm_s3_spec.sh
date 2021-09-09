#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    helm plugin list | grep "s3" | grep "${HELM_S3_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${HELM_S3_VERSION}"
    The status should eq 0
  End
End
