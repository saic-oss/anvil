Describe "printVersion()"
  printVersion() {
    kubectl version --client=true | grep "${KUBECTL_VERSION}"
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

  It "validates 1.16, 1.17, and 1.18 is installed"
    When call listInstalledVersions
    The output should include "1.16."
    The output should include "1.17."
    The output should include "1.18."
    The status should eq 0
  End
End
