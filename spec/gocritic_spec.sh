#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    cd ~/go/pkg/mod/github.com/go-critic/go-critic\@v0.5.7/;gocritic version
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The stderr should be present
    The status should eq 0
  End
End
