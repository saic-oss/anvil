#!/usr/bin/env shellspec

Describe "Check for a Go-Task update"
  Include ./lib_updates
  It "validates Go-Task is up-to-date via GitHub"
    When call getLatestGitHubTag go-task/task
    The output should include "${GO_TASK_VERSION}"
    The status should eq 0
  End
End
