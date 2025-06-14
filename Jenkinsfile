pipeline {
    agent any

    environment {
        TF_VAR_public_key   = credentials('atlas-public-key')   
        TF_VAR_private_key  = credentials('atlas-private-key')  
        TF_VAR_org_id       = credentials('atlas-org-id')       
        TF_VAR_db_user      = credentials('mongo-db-user')      
        TF_VAR_db_password  = credentials('mongo-db-pass')      
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/Akilesh-GA/TerraformAutomation.git'
            }
        }

        stage('Initialize Terraform') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }

    post {
        success {
            echo 'MongoDB Atlas infrastructure deployed successfully!'
        }
        failure {
            echo 'Terraform apply failed!'
        }
    }
}
