pipeline {
    agent none
    stages {
        stage('Backend build and test') {
            agent {
                docker { image 'mcr.microsoft.com/dotnet/core/sdk:3.1' }
            }
            steps {
                sh 'ls'
                sh 'cd /app'
                sh 'dotnet build'
                sh 'dotnet test'
            }
        }
        stage('Frontend build and test') {
            agent {
                docker { image 'node:10-alpine' }
            }
            steps {
                sh 'cd /app/DotnetTemplate.Web'
                sh 'npm i'
                sh 'npm run build'
                sh 'npm t'
                sh 'npm run lint'
            }
        }
    }
}