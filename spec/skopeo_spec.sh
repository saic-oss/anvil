#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    skopeo -v | grep "${SKOPEO_BINARY_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${SKOPEO_BINARY_VERSION}"
    The status should eq 0
  End
End
