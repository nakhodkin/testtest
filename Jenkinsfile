pipeline {
    agent {
        docker { image 'node:12-stretch' }
    }
    stages {
        stage('Test environenment') {
            steps {
                sh 'node --version'
                sh 'npm --version'
            }
        }
        stage('Install dependencies') {
            steps {
                sh 'npm install'
            }
        }
    }
}
