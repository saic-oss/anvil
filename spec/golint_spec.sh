#!/usr/bin/env shellspec

Describe "printHelp()"
  printHelp() {
    golint --help
  }

  It "validates tool is installed by running it"
    When call printHelp
    The status should eq 0
  End
End
