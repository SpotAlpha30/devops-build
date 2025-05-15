pipeline {
    agent any

    environment {
        // Define branch name explicitly
        BRANCH_NAME = 'main'

        // GitHub credentials stored in Jenkins
        GITHUB_CREDENTIALS = credentials('github')

        // DockerHub credentials stored in Jenkins
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${env.BRANCH_NAME}",
                    credentialsId: 'github',
                    url: 'https://github.com/SpotAlpha30/devops-build.git'
            }
        }

        stage('Build') {
            steps {
                sh './build.sh Sudharsan30/${env.BRANCH_NAME == "main" ? "prod" : "dev"} latest'
            }
        }

        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
                    sh 'echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin'
                    sh 'docker push Sudharsan30/${env.BRANCH_NAME == "main" ? "prod" : "dev"}:latest'
                    sh 'docker logout'
                }
            }
        }

        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                sh './deploy.sh Sudharsan30/prod latest'
            }
        }
    }
}

