#!/usr/bin/env shellspec

Describe "printHelp()"
  printHelp() {
    gocyclo --help
  }

  It "validates tool is installed by running it"
    When call printHelp
    The stderr should be present
    The status should eq 2
  End
End
