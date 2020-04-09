pipeline {
    agent {
        docker { image 'node:alpine' }
    }
    stages {
        stage('Test environenment') {
            steps {
                sh 'docker --version'
                sh 'node --version'
            }
        }
        stage('Install dependencies') {
            steps {
                sh 'npm install'
            }
        }
    }
}
