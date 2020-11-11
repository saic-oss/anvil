#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    aws --version | grep "${AWS_CLI_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${AWS_CLI_VERSION}"
    The status should eq 0
  End
End
