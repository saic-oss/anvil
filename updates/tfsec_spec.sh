#!/usr/bin/env shellspec

Describe "Check for TFsec update"
  Include ./lib_updates
  It "validates TFsec is up-to-date via asdf"
    When call getLatestVersionFromAsdfList tfsec
    The output should include "${TFSEC_VERSION}"
    The status should eq 0
  End
End
