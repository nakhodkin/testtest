pipeline {
    agent {
        docker {
            image 'node:12-stretch'
            args '-u 0:0'
        }
    }
    stages {
        environment {
            NODE_ENV = "production"
        }
        stage('Test environenment') {
            steps {
                sh 'node --version'
                sh 'npm --version'
            }
        }
        stage('Install dependencies') {
            steps {
                sh 'npm ci'
            }
        }
        stage('Run unit tests') {
            steps {
                sh 'npm ci'
            }
        }
        stage('Audit dependencies') {
            steps {
                sh 'npm test'
            }
        }
        stage('Build') {
            steps {
                sh 'echo builing...'
                sh 'echo $NODE_ENV'
            }
        }
    }
}
