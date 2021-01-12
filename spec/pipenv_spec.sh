#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    pipenv --version | grep "${PIP_ENV_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${PIP_ENV_VERSION}"
    The status should eq 0
  End
End
