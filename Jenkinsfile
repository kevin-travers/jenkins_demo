pipeline {
    agent any
    stages {
        stage('Terraform Init') {
            steps {
                echo 'Terraform Init'
                sh "rm -RF .terraform"
                sh "terraform init -input=false"
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