Describe "printVersion()"
  printVersion() {
    # The string used in the JAVA_VERSION doesn't appear in java -version
    java -version 2>&1
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "openjdk"
    The status should eq 0
  End
End

Describe "getInstalledVersions()"
  getInstalledVersions() {
    asdf list java
  }

  It "validates correct version of tool is installed"
    When call getInstalledVersions
    The output should include "${JAVA_VERSION}"
    The status should eq 0
  End
End
