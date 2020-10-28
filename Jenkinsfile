pipeline {
    agent none

    stages {
        stage('Backend build and test') {
            agent {
                docker { image 'mcr.microsoft.com/dotnet/core/sdk:3.1' }
            }
            environment {
                DOTNET_CLI_HOME = "/tmp/DOTNET_CLI_HOME"
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