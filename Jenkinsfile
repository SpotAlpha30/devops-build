pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
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
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push sudharsan30/${env.BRANCH_NAME == "main" ? "prod" : "dev"}:latest'
                sh 'docker logout'
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
