#!/usr/bin/env shellspec

Describe "Check for Go update"
  Include ./lib_updates
  It "validates Go is up-to-date via asdf"
    When call getLatestVersionFromAsdf golang
    The output should include "${GO_VERSION}"
    The status should eq 0
  End
End
