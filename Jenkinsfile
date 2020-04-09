pipeline {
    agent {
        dockerfile true
    }
    stages {
        stage('Test environenment') {
            steps {
                sh 'docker --version'
                sh 'node --version'
            }
        }
    }
}
