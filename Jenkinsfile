pipeline {
    agent any

    environment {
        // GitHub credentials stored in Jenkins
        GITHUB_CREDENTIALS = credentials('github') 
        // DockerHub credentials stored in Jenkins
        DOCKERHUB_CREDENTIALS = credentials('dockerhub') 
    }

    stages {
        stage('Checkout') {
            steps {
                // Use GitHub credentials for cloning the repo
                git branch: "${env.BRANCH_NAME}", credentialsId: 'github', url: 'https://github.com/SpotAlpha30/devops-build.git'
            }
        }

        stage('Build') {
            steps {
                // Run build script with environment-based image tags
                sh './build.sh Sudharsan30/${env.BRANCH_NAME == "main" ? "prod" : "dev"} latest'
            }
        }

        stage('Push') {
            steps {
                // Use Docker Hub credentials for login and pushing images
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
                // Deploy to the production environment for the 'main' branch
                sh './deploy.sh Sudharsan30/prod latest'
            }
        }
    }
}

