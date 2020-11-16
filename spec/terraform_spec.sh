#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    terraform --version | grep "${TERRAFORM_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${TERRAFORM_VERSION}"
    The status should eq 0
  End
End
