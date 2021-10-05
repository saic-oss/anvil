#!/usr/bin/env shellspec

Describe "Check for Go Releaser update"
  Include ./lib_updates
  It "validates Go Releaser is up-to-date via asdf"
    When call getLatestVersionFromAsdf goreleaser
    The output should include "${GORELEASER_VERSION}"
    The status should eq 0
  End
End
