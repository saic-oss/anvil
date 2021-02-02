#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    gocritic version
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The stderr should be present
    The status should eq 0
  End
End
