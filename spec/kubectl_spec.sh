#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    kubectl version --client=true --output=yaml | grep "${KUBECTL_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${KUBECTL_VERSION}"
    The status should eq 0
  End
End

Describe "getInstalledVersions()"
  listInstalledVersions() {
    asdf list kubectl
  }

  It "validates 1.17, 1.18, 1.19, and 1.20 are installed"
    When call listInstalledVersions
    The output should include "1.17."
    The output should include "1.18."
    The output should include "1.19."
    The output should include "1.20."
    The status should eq 0
  End
End
