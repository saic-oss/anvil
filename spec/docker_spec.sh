#!/usr/bin/env shellspec

Describe "printVersion()"
  printVersion() {
    dnf list docker-ce | grep "${DOCKER_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${DOCKER_VERSION}"
    The status should eq 0
  End
End
