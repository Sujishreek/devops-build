pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'devops-build-react-app'
        DOCKER_TAG = 'latest'
    }
    stages {
        stage('Clone') {
            steps {
                git branch: 'dev', url: 'https://github.com/Sujishreek/devops-build.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    docker tag $DOCKER_IMAGE $DOCKER_USER/$DOCKER_IMAGE:$DOCKER_TAG
                    docker push $DOCKER_USER/$DOCKER_IMAGE:$DOCKER_TAG
                    '''
                }
            }
        }
    }
}
