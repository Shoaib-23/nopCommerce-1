pipeline {
    agent { label 'NOP'}
    stages {
        stage('git clone') {
            steps {
                git url: 'https://github.com/Shoaib-23/nopCommerce-1.git',
                    branch: 'develop'
            }
            steps('build and push the image') {        
                    sh 'docker image build -t shoaib23/nopCommerce:latest .'
                    sh 'docker image push shoaib23/nopCommerce:latest'
            }
        }
    }
}
