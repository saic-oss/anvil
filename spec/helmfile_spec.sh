#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    helmfile --version | grep "${HELMFILE_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${HELMFILE_VERSION}"
    The status should eq 0
  End
End
