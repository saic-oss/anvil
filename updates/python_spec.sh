#!/usr/bin/env shellspec

Describe "Check for Python update"
  Include ./lib_updates
  It "validates Python is up-to-date via asdf"
    When call getLatestVersionFromAsdf python
    The output should include "${PYTHON_VERSION}"
    The status should eq 0
  End
End
