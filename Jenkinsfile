pipeline {
    agent { label 'NOP'}
    triggers { pollSCM ('* * * * *') }
    stages {
        stage('git clone') {
            steps {
                git url: 'https://github.com/Shoaib-23/nopCommerce-1.git',
                    branch: 'develop'
            }
        }
        stage('restore') {
            steps {
                sh 'dotnet restore src/NopCommerce.sln'
            }
        }
        stage('build') {
            steps {
                sh 'dotnet build src/NopCommerce.sln'
            }
        }
        stage('publish') {
            steps {
                sh 'dotnet publish -c Release src/Presentation/Nop.Web/Nop.Web.csproj -o publish'
            }
        }
        stage('make directory') {
            steps {
                sh 'mkdir publish/bin publish/logs'
            }
        }
        stage('create zip') {
            steps {
                sh 'zip -r nopCommerce.zip publish'
            }
        }
        stage('archive') {
            steps {
                archive '**/nopCommerce.zip'
            }
        }
    }
}
