#!/usr/bin/env shellspec

Describe "Check for Kubectl update"
  Include ./lib_updates
  It "validates Kubectl is up-to-date via asdf"
    When call getLatestVersionFromAsdf kubectl
    The output should include "${KUBECTL_VERSION}"
    The status should eq 0
  End
End
