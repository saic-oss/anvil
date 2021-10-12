#!/usr/bin/env shellspec

Describe "Check for Maven update"
  Include ./lib_updates
  It "validates Maven is up-to-date via asdf"
    When call getLatestVersionFromAsdf maven
    The output should include "${MAVEN_VERSION}"
    The status should eq 0
  End
End
