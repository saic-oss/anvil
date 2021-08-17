#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    podman -v | grep "${PODMAN_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${PODMAN_VERSION}"
    The status should eq 0
  End
End
