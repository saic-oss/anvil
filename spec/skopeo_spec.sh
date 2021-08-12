#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    skopeo version | grep "${SKOPEO_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${SKOPEO_VERSION}"
    The status should eq 0
  End
End
