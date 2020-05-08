# signature-validation
## Basic Goal
- CentOS container
- Monitors a shared volume for new folders
  - Enters folders when it sees them and looks at contents
  - Looks for signed files and then attempts to verify the signatures on those files
  - Reports on result of above actions
## Let's start with GPG
And let's start really basic:
- Script that takes a folder and tells me if all the contents are signed with a key from a trusted keyring
