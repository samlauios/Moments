// pipeline {
//     agent any
//     stages {
//         stage('install') {
//             steps {
//                 bundle install
//                 bundle exec pod install
//             }
//         }
//         stage('build') {
//             steps {
//                 bundle exec fastlane download_profiles
//                 bundle exec fastlane archive_internal
//             }
//         }
//         stage('test') {
//             steps {
//                 bundle exec fastlane download_profiles
//                 bundle exec fastlane tests 
//             }
//         }
//         stage('archive, sign and deploy internal app') {
//             steps {
//                 bundle exec fastlane download_profiles
//                 sh ./scripts/increase_build_number.sh
//                 bundle exec fastlane archive_internal
//                 bundle exec fastlane deploy_internal

//             }
//         }
//         stage('archive, sign and deploy production app') {
//             steps {
//                 bundle exec fastlane download_profiles
//                 sh ./scripts/increase_build_number.sh
//                 bundle exec fastlane archive_appstore
//                 bundle exec fastlane deploy_appstore
//             }
//         }
//     }
// }