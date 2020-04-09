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
                sh 'node --version'
                sh 'npm --version'
            }
        }
        stage('Install dependencies') {
            steps {
                sh 'npm install'
                sh 'ls node_modules'
            }
        }
        stage('Audit dependencies') {
            steps {
                sh 'npm audit'
            }
        }
        stage('Run unit tests') {
            steps {
                sh 'npm install'
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
    post {
        always {
            deleteDir() /* clean up our workspace */
        }
    }
}
