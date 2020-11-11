Describe "printVersion()"
  printVersion() {
    hadolint --version | grep "${HADOLINT_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${HADOLINT_VERSION}"
    The status should eq 0
  End
End
