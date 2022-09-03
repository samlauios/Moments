pipeline {
    agent any
    environment {
        http_proxy = "http://127.0.0.1:1087"
        https_proxy= "http://127.0.0.1:1087"

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
                #!/bin/bash
                export PATH=/usr/local/bin:$PATH
                eval "$(rbenv init -)"
                rbenv local
                rbenv rehash
                which bundle
                '''
                sh '''
                bundle install
                which bundle
                '''
                sh 'bundle exec pod install'
            }
        }

        stage('build') {
            steps {
                sh 'bundle exec fastlane download_profiles'
                sh 'bundle exec fastlane archive_internal'
            }
        }

        stage('test') {
            steps {
                sh 'bundle exec fastlane download_profiles'
                sh 'bundle exec fastlane tests'
            }
        }

        stage('archive, sign and deploy internal app') {
            when {
                branch 'main'
            }

            steps {
                sh 'bundle exec fastlane download_profiles'
                sh './scripts/increase_build_number.sh'
                sh 'bundle exec fastlane archive_internal'
                sh 'bundle exec fastlane deploy_internal'

            }
        }

        stage('archive, sign and deploy production app') {
            when {
                branch 'release'
            }
            steps {
                sh 'bundle exec fastlane download_profiles'
                sh './scripts/increase_build_number.sh'
                sh 'bundle exec fastlane archive_appstore'
                sh 'bundle exec fastlane deploy_appstore'
            }
        }
    }
}