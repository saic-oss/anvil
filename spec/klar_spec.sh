#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    # Klar doesn't have a command to display its version, so we are just making sure we are getting output that we expect
    klar
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The error should include "Image name must be provided"
    The status should eq 2
  End
End
