Describe "printVersion()"
  printVersion() {
    task --version 2>&1 | grep "${GO_TASK_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${GO_TASK_VERSION}"
    The status should eq 0
  End
End
