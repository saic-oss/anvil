#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    dnf list installed 2>&1 | grep "containerd.io"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${CONTAINERD_VERSION}"
    The status should eq 0
  End
End
