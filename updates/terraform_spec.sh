#!/usr/bin/env shellspec

Describe "Check for Terraform update"
  Include ./lib_updates
  It "validates Terraform is up-to-date via asdf"
    When call getLatestVersionFromAsdf terraform
    The output should include "${TERRAFORM_VERSION}"
    The status should eq 0
  End
End
