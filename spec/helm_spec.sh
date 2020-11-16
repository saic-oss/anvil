#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    helm version | grep "${HELM_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${HELM_VERSION}"
    The status should eq 0
  End
End
