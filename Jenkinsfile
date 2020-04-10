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
            }
        }
        stage('Install dependencies') {
            steps {
                sh 'npm install jest'
                sh 'npm install'
                sh 'ls node_modules'
            }
        }
        stage('Audit dependencies') {
            steps {
                sh 'npm audit'
            }
        }
        stage('Static checks') {
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
        stage('Build') {
            steps {
                sh 'echo builing...'
                sh 'echo $NODE_ENV'
            }
        }
    }
    post {
        always {
            deleteDir()
        }
    }
}
