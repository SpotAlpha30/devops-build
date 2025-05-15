pipeline {
    agent any
    environment {
        IMAGE_NAME = "sudharsan30/dev"
        TAG = "latest"
    }
    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github', url: 'https://github.com/SpotAlpha30/devops-build.git'
            }
        }

        stage('Build') {
            steps {
                sh './build.sh'
            }
        }

        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
                    sh './build.sh'
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploy stage (implement as needed)'
            }
        }
    }
}
