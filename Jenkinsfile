pipeline {
  agent any

  stages {
    stage('Clone') {
      steps {
        git branch: 'dev', url: 'https://github.com/sriram-R-krishnan/devops-build'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'bash build.sh'
      }
    }

    stage('Push to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
          sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
          sh 'docker push sujishreek/dev:latest'
        }
      }
    }

    stage('Deploy') {
      steps {
        sh 'bash deploy.sh'
      }
    }
  }
}
