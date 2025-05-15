pipeline {
    agent any

    environment {
        GITHUB_CREDENTIALS = credentials('github')
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/SpotAlpha30/devops-build.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    def imageTag = (env.BRANCH_NAME == 'main') ? 'prod' : 'dev'
                    sh "./build.sh Sudharsan30/${imageTag} latest"
                }
            }
        }

        stage('Push') {
            steps {
                script {
                    def imageTag = (env.BRANCH_NAME == 'main') ? 'prod' : 'dev'
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
                        sh '''
                            echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin
                        '''
                        sh "docker push Sudharsan30/${imageTag}:latest"
                        sh "docker logout"
                    }
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
