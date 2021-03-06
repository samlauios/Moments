fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios lint_code
```
fastlane ios lint_code
```
Lint code
### ios format_code
```
fastlane ios format_code
```
Lint and format code
### ios sort_files
```
fastlane ios sort_files
```
Sort Xcode project files
### ios prepare_pr
```
fastlane ios prepare_pr
```
Prepare for a pull request
### ios build
```
fastlane ios build
```
Build development app
### ios tests
```
fastlane ios tests
```
Run unit tests
### ios download_profiles
```
fastlane ios download_profiles
```
Download certificates and profiles
### ios create_new_profiles
```
fastlane ios create_new_profiles
```
Create all new provisioning profiles managed by fastlane match
### ios nuke_profiles
```
fastlane ios nuke_profiles
```
Nuke all provisioning profiles managed by fastlane match
### ios add_device
```
fastlane ios add_device
```
Add new device to provisioning profile
### ios archive_internal
```
fastlane ios archive_internal
```
Create an archive of the internal app for testing
### ios archive_appstore
```
fastlane ios archive_appstore
```
Create an archive of the production app with app store distribution
### ios deploy_internal
```
fastlane ios deploy_internal
```
Deploy the internal app to Firebase Distribution
### ios deploy_appstore
```
fastlane ios deploy_appstore
```
Deploy the production app to App Store

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
