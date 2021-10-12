#!/usr/bin/env shellspec

Describe "Check for Helm update"
  Include ./lib_updates
  It "validates Helm is up-to-date via asdf"
    When call getLatestVersionFromAsdf helm
    The output should include "${HELM_VERSION}"
    The status should eq 0
  End
End
