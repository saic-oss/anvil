#!/usr/bin/env shellspec

Describe "Check for a Java update"
  Include ./lib_updates
  It "validates Java is up-to-date via asdf"
    When call getLatestVersionFromAsdfList java
    The output should include "${JAVA_VERSION}"
    The status should eq 0
  End
End
