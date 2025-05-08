pipeline {
    agent any

    environment {
        GITHUB_CREDENTIALS = credentials('github')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${env.BRANCH_NAME}", credentialsId: 'github', url: 'https://github.com/SpotAlpha30/devops-build.git'
            }
        }

        stage('Build') {
            steps {
                sh './build.sh sudharsan30/${env.BRANCH_NAME == "main" ? "prod" : "dev"} latest'
            }
        }

        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
                    sh 'echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin'
                    sh 'docker push sudharsan30/${env.BRANCH_NAME == "main" ? "prod" : "dev"}:latest'
                    sh 'docker logout'
                }
            }
        }

        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                sh './deploy.sh sudharsan30/prod latest'
            }
        }
    }
}

