#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    python --version | grep "${PYTHON_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${PYTHON_VERSION}"
    The status should eq 0
  End
End
