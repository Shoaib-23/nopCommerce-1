pipeline {
    agent { label 'NOP'}
    stages {
        stage('git clone') {
            steps {
                git url: 'https://github.com/Shoaib-23/nopCommerce-1.git',
                    branch: 'develop'
            }
        }    
        stage('build and push the image') {    
            steps {        
                    sh 'docker image build -t shoaib23/nopcommerce:new .'
                    sh 'docker image push shoaib23/nopcommerce:new'
            }
        }
    }        
}
