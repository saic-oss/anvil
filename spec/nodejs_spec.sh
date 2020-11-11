Describe "printVersion()"
  printVersion() {
    node --version | grep "${NODEJS_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${NODEJS_VERSION}"
    The status should eq 0
  End
End
