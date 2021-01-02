#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    go version | grep "${GO_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${GO_VERSION}"
    The status should eq 0
  End
End
