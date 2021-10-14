#!/usr/bin/env shellspec

Describe "Check for GolangCI Lint update"
  Include ./lib_updates
  It "validates GolangCI Lint is up-to-date via asdf"
    When call getLatestVersionFromAsdf golangci-lint
    The output should include "${GOLANGCI_LINT_VERSION}"
    The status should eq 0
  End
End
