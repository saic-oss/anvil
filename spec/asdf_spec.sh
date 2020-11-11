Describe "printVersion()"
  printVersion() {
    asdf --version | grep "${ASDF_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${ASDF_VERSION}"
    The status should eq 0
  End
End
