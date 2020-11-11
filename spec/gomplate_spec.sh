Describe "printVersion()"
  printVersion() {
    gomplate --version | grep "${GOMPLATE_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${GOMPLATE_VERSION}"
    The status should eq 0
  End
End
