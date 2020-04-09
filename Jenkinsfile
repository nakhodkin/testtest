pipeline {
    agent {
        docker { image 'node:12-stretch' }
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
