#!/usr/bin/env shellspec

Describe "Check for a Docker Compose update"
  Include ./lib_updates
  It "validates Docker Compose is up-to-date via GitHub"
    When call getLatestGitHubTag docker/compose
    The output should include "${DOCKER_COMPOSE_VERSION}"
    The status should eq 0
  End
End
