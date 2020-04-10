@Library('github.com/releaseworks/jenkinslib') _

node {
  stage("Checkout") {
    checkout scm
  }
  stage("List S3 buckets") {
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'aws-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY']]) {
        AWS("--region=eu-west-1 s3 ls")
    }
  }
  stage("Check env") {
    sh """
        node --version
        npm --version
        aws --version
        docker --version
    """
  }
  stage("Build") {
    def customImage = docker.build("my-image:${env.BUILD_ID}")

    customImage.inside {
        sh 'echo Hello'
    }

    customImage.withRun('-e "MYSQL_ROOT_PASSWORD=my-secret-pw" -v ${PWD}:/usr/app') { c ->
        sh 'npm run test:ci'
        docker cp ${c.id}:/usr/app/junit.xml .
    }

    sh 'ls'
    sh 'echo -------------------------------'
  }
}
