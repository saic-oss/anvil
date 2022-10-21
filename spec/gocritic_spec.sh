#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    echo $(find / -name "go-critic@*" -type d 2>/dev/null)
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${GOCRITIC_VERSION}"
    The status should eq 0
  End
End
