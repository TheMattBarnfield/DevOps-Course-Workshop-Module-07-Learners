pipeline {
    agent none
    stages {
        stage('Backend build and test') {
            agent {
                docker { image 'dotnet/core/sdk' }
            }
            steps {
                sh 'dotnet build'
                sh 'dotnet test'
            }
        }
        stage('Frontend build and test') {
            agent {
                docker { image 'node:10-alpine' }
            }
            steps {
                sh 'cd DotnetTemplate.Web'
                sh 'npm i'
                sh 'npm run build'
                sh 'npm t'
                sh 'npm run lint'
            }
        }
    }
}