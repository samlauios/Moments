pipeline {
    agent any
    environment {
        http_proxy = "http://127.0.0.1:1087"
        https_proxy= "http://127.0.0.1:1087"

        LANG="en_US.UTF-8"
        PATH="~/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

        CI_BUILD_NUMER = "${env.BUILD_NUMBER}"

        GITHUB_USERNAME = credentials('github-username')
        GITHUB_API_TOKEN = credentials('github-api-token') 
        MATCH_PASSWORD = credentials('match-password')
        APP_STORE_CONNECT_API_CONTENT = credentials('app-store-connect-api-content') 
        FIREBASE_TOKEN = credentials('firebase-token')
    }
    stages {
        stage('install') {
            steps {
                sh '''
                git submodule init
                git submodule update 
                bundle install
                bundle exec pod install
                '''
            }
        }

        stage('build') {
            steps {
                sh '''
                bundle exec fastlane download_profiles
                bundle exec fastlane archive_internal
                '''
            }
        }

        stage('test') {
            steps {
                sh '''
                bundle exec fastlane download_profiles
                bundle exec fastlane tests
                '''
            }
        }

        stage('archive, sign and deploy internal app') {
            when {
                branch 'main'
            }

            steps {
                sh '''
                bundle exec fastlane download_profiles
                ./scripts/increase_build_number.sh
                bundle exec fastlane archive_internal
                bundle exec fastlane deploy_internal
                '''
            }
        }

        stage('archive, sign and deploy production app') {
            when {
                branch 'release'
            }
            steps {
                sh '''
                bundle exec fastlane download_profiles
                ./scripts/increase_build_number.sh
                bundle exec fastlane archive_appstore
                bundle exec fastlane deploy_appstore
                '''
            }
        }
    }
}