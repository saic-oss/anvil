#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    tflint --version | grep "${TFLINT_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${TFLINT_VERSION}"
    The status should eq 0
  End
End
