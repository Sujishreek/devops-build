pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-react-app"
        DEV_REPO = "sujishreek/dev"
        PROD_REPO = "sujishreek/prob-react-app"
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Docker Build') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                }
            }
        }

        stage('Push to Dev Repo') {
            when {
                branch 'dev'
            }
            steps {
                sh """
                    docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${DEV_REPO}:${IMAGE_TAG}
                    docker push ${DEV_REPO}:${IMAGE_TAG}
                """
            }
        }

        stage('Push to Prod Repo') {
            when {
                branch 'master'
            }
            steps {
                sh """
                    docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${PROD_REPO}:${IMAGE_TAG}
                    docker push ${PROD_REPO}:${IMAGE_TAG}
                """
            }
        }

        stage('Deploy') {
            steps {
                sh './deploy.sh'
            }
        }
    }
}
