#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    shellspec --version | grep "${SHELLSPEC_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${SHELLSPEC_VERSION}"
    The status should eq 0
  End
End
