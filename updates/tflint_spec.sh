#!/usr/bin/env shellspec

Describe "Check for TFlint update"
  Include ./lib_updates
  It "validates TFlint is up-to-date via asdf"
    When call getLatestVersionFromAsdfList tflint
    The output should include "${TFLINT_VERSION}"
    The status should eq 0
  End
End
