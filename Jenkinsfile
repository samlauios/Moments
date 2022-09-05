pipeline {
    agent any
    environment {
        http_proxy = "http://127.0.0.1:1087"
        https_proxy= "http://127.0.0.1:1087"

        LANG="en_US.UTF-8"
        PATH="~/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

        CI_BUILD_NUMBER = "${env.BUILD_NUMBER}"

        MATCH_GIT_BASIC_AUTHORIZATION = credentials('match_git_basic_authorization')
        MATCH_PASSWORD = credentials('match-password')
        APP_STORE_CONNECT_API_CONTENT = credentials('app-store-connect-api-content') 
        FIREBASE_TOKEN = credentials('firebase-token')
    }
    stages {
        stage('install tools') {
            steps {
                sh '''
                git submodule init
                git submodule update 
                bundle install
                bundle exec pod install
                '''
            }
        }

        stage('download profiles') {
            steps {
                sh '''
                bundle exec fastlane download_profiles
                '''
            }
        }

        stage('test') {
            steps {
                sh '''
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
                ./scripts/increase_build_number.sh
                bundle exec fastlane archive_internal
                bundle exec fastlane deploy_internal
                '''
                mail to: 'liuyaozhu13hao@163.com',
                     subject: 'Deploy internal app to firebase successfully',
                     body: 'Checkout more detail to ${env.BUILD_URL}'
            }
        }

        stage('archive, sign and deploy production app') {
            when {
                branch 'release'
            }
            steps {
                sh '''
                ./scripts/increase_build_number.sh
                bundle exec fastlane archive_appstore
                bundle exec fastlane deploy_appstore
                '''
                mail to: 'liuyaozhu13hao@163.com',
                     subject: 'Deploy production app to app store successfully',
                     body: 'Checkout more detail to ${env.BUILD_URL}'
            }
        }
    }
    post {
        failure {
            mail to: 'liuyaozhu13hao@163.com',
                 subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
                 body: "Something is wrong with ${env.BUILD_URL}"
        }
    }
}