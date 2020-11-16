#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    mvn --version | grep "${MAVEN_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${MAVEN_VERSION}"
    The status should eq 0
  End
End
