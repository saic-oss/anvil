Describe "printVersion()"
  printVersion() {
    docker-compose --version | grep "${DOCKER_COMPOSE_VERSION}"
  }

  It "validates tool is installed by checking version"
    When call printVersion
    The output should include "${DOCKER_COMPOSE_VERSION}"
    The status should eq 0
  End
End
