#!/usr/bin/env shellspec

Describe "Check for a Pre-commit update"
  Include ./lib_updates
  It "validates Pre-commit is up-to-date via pip"
    When call getLatestVersionFromPip pre-commit
    The output should include "${PRE_COMMIT_VERSION}"
    The status should eq 0
  End
End
