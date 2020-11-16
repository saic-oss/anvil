#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    tfsec --version | grep "${TFSEC_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${TFSEC_VERSION}"
    The status should eq 0
  End
End
