pipeline {
    agent {
        docker {
            image 'node:12-stretch'
            args '-u 0:0'
        }
    }
    environment {
        NODE_ENV = "production"
    }
    stages {
        stage('Test environenment') {
            steps {
                sh 'pwd'
                sh 'ls'
                sh 'cat package.json'
                sh 'node --version'
                sh 'npm --version'
                sh 'env'
            }
        }
        stage('Install dependencies') {
            steps {
                sh 'npm install jest'
                sh 'npm install'
                sh 'ls node_modules'
            }
        }
        stage('Static checks') {
            parallel {
                 stage('Audit dependencies') {
                     steps {
                         sh 'npm audit'
                     }
                 }
                 stage('Code style checks') {
                     steps {
                         sh 'echo eslint checks...'
                     }
                 }
                 stage('Run unit tests') {
                     steps {
                         sh 'npm test'
                     }
                     post {
                         always {
                             junit 'junit.xml'
                             cobertura coberturaReportFile: 'coverage/cobertura-coverage.xml', conditionalCoverageTargets: '20, 0, 0', lineCoverageTargets: '20, 0, 0', methodCoverageTargets: '20, 0, 0', fileCoverageTargets: '20, 0, 0', autoUpdateHealth: false, autoUpdateStability: false
                         }
                     }
                 }
            }
        }
        stage('Build') {
            agent any
            steps {
                script {
                    def dockerfile = 'Dockerfile'
                    def customImage = docker.build("ecommerce-platform:${env.BUILD_ID}")
                }
            }
        }
    }
    post {
        success {
            script {
                sh 'echo SUCCESS'
            }
        }
        failure {
            script {
                sh 'echo FAILURE'
            }
        }
        always {
            deleteDir()
        }
    }
}
