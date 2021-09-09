#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    serverless --version | grep --color=never "${SERVERLESS_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${SERVERLESS_VERSION}"
    The status should eq 0
  End
End
