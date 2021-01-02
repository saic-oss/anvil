#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    golangci-lint --version | grep "${GOLANGCI_LINT_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${GOLANGCI_LINT_VERSION}"
    The status should eq 0
  End
End
