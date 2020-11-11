# template-repo

Template repository that has the necessary baseline files for a new repo

## Files

| File                        | Description                                                                                     |
| --------------------------- | ----------------------------------------------------------------------------------------------- |
| \.github/CODEOWNERS         | Used to automatically choose PR reviewers based on who owns the code                            |
| \.github/stale\.yaml        | Config file for the Stale plugin                                                                |
| \.editorconfig              | Shared code style config file                                                                   |
| \.gitignore                 | Git ignore file                                                                                 |
| \.pre\-commit\-config\.yaml | Config file for pre\-commit hooks\. Delete/comment out hooks you don't need                     |
| \.prettierignore            | Prettier ignore file                                                                            |
| \.remarkrc                  | Config file for remark\-lint which Codacy uses                                                  |
| LICENSE                     | Project license \- Default is Apache 2\.0\. Get approval if you want to use a different license |
| README\.md                  | Main README file that all repos need to have                                                    |
| Taskfile\.yml               | Config file for Go\-Task\. We prefer Go\-Task over Make                                         |
