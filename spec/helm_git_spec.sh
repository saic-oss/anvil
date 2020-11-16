#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    helm plugin list | grep "helm-git" | grep "${HELM_GIT_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${HELM_GIT_VERSION}"
    The status should eq 0
  End
End
