#!/usr/bin/env shellspec

Describe "Check for Helmfile update"
  Include ./lib_updates
  It "validates Helmfile is up-to-date via asdf"
    When call getLatestVersionFromAsdf helmfile
    The output should include "${HELMFILE_VERSION}"
    The status should eq 0
  End
End
