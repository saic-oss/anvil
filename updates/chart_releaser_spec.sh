#!/usr/bin/env shellspec

Describe "Check for Helm Chart Releaser update"
  Include ./lib_updates
  It "validates Helm Chart Releaser is up-to-date via asdf"
    When call getLatestVersionFromAsdf helm-cr
    The output should include "${CHART_RELEASER_VERSION}"
    The status should eq 0
  End
End
