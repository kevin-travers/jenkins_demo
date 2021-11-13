pipeline {
    agent any
    stages {
        stage('Terraform Init') {
            steps {
                echo 'Terraform Init'
                sh "pwd"
            }
        }
        stage('test') {
            steps {
                echo 'testting infastrucutre'
            }
        }
        stage('deploy') {
            steps {
                echo 'deploying infastrucutre'
            }
        }
    }
}