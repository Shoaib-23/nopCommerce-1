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
                script {
                    // Check if directories exist before creating
                    if (!fileExists('publish/bin')) {
                        sh 'mkdir publish/bin'
                    }
                    if (!fileExists('publish/logs')) {
                        sh 'mkdir publish/logs'
                    }
                    // Create a new file with a unique name
                    def uniqueFileName = "newFile_${UUID.randomUUID()}.txt"
                    writeFile(file: "publish/logs/${uniqueFileName}", text: "This is a new file.")
                }
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

def fileExists(filePath) {
    return file(filePath).exists()
}
