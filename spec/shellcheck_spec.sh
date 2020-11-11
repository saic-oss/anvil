#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    shellcheck --version | grep "${SHELLCHECK_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${SHELLCHECK_VERSION}"
    The status should eq 0
  End
End
