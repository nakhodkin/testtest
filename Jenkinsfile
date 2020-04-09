pipeline {
    agent {
        label 'master'
        dockerfile true
    }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
    }
}
