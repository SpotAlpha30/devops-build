pipeline {
    agent any
    environment {
        IMAGE_NAME = "sudharsan30/dev"
        TAG = "latest"
    }
    stages {
        stage('Checkout') {
            steps {
                // Specify branch explicitly to avoid Jenkins defaulting to master
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/SpotAlpha30/devops-build.git'
            }
        }

        stage('Build') {
            steps {
                sh './build.sh build' // Suggest separating build and push in your script
            }
        }

        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
                    sh './build.sh push' // Push image separately for clarity
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
