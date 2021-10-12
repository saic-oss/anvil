#!/usr/bin/env shellspec

Describe "Check for Terraform Docs update"
  Include ./lib_updates
  It "validates Terraform Docs is up-to-date via asdf"
    When call getLatestVersionFromAsdfList terraform-docs
    The output should include "${TERRAFORM_DOCS_VERSION}"
    The status should eq 0
  End
End
