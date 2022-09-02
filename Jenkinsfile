pipeline {
    agent any
    environment {
        CI_BUILD_NUMER = ${env.BUILD_NUMBER}

        GITHUB_USERNAME = credentials('github-username')
        GITHUB_API_TOKEN = credentials('github-api-token') 
        MATCH_PASSWORD = credentials('match-password')
        APP_STORE_CONNECT_API_CONTENT = credentials('app-store-connect-api-content') 
        FIREBASE_TOKEN = credentials('firebase-token')
    }
    stages {
        stage('install') {
            steps {
                bundle install
                bundle exec pod install
            }
        }

        stage('build') {
            steps {
                bundle exec fastlane download_profiles
                bundle exec fastlane archive_internal
            }
        }

        stage('test') {
            steps {
                bundle exec fastlane download_profiles
                bundle exec fastlane tests 
            }
        }

        stage('archive, sign and deploy internal app') {
            when {
                branch 'main'
            }

            steps {
                bundle exec fastlane download_profiles
                sh ./scripts/increase_build_number.sh
                bundle exec fastlane archive_internal
                bundle exec fastlane deploy_internal

            }
        }
        
        stage('archive, sign and deploy production app') {
            when {
                branch 'release'
            }
            steps {
                bundle exec fastlane download_profiles
                sh ./scripts/increase_build_number.sh
                bundle exec fastlane archive_appstore
                bundle exec fastlane deploy_appstore
            }
        }
    }
}