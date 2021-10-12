#!/usr/bin/env shellspec

Describe "Check for Sonarscanner update"
  Include ./lib_updates
  It "validates Sonarscanner is up-to-date via asdf"
    When call getLatestVersionFromAsdf sonarscanner
    The output should include "${SONARSCANNER_VERSION}"
    The status should eq 0
  End
End
