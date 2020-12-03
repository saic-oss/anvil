#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    helm-cr version | grep "${CHART_RELEASER_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${CHART_RELEASER_VERSION}"
    The status should eq 0
  End
End
