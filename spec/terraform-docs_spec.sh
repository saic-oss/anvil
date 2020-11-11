#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    terraform-docs --version | grep "${TERRAFORM_DOCS_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${TERRAFORM_DOCS_VERSION}"
    The status should eq 0
  End
End
