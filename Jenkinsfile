pipeline {
    agent any

    stages {
        stage('code from s3') {
            steps {
                sh '''sudo aws s3 cp s3://etp-epam/app.zip app/
cd app/
sudo unzip -o app.zip'''
            }
        }
         stage('build') {
            steps {
                sh '''cd app/
                sudo docker build . -t epam-app'''

            }
            
        }
         stage('deploy') {
            steps {
                sh '''cd app
                sudo docker-compose down && sudo docker-compose up -d'''
            }
        }
    }
        
}
