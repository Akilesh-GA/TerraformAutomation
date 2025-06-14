pipeline {
    agent any

    environment {
        TF_VAR_public_key   = credentials('mongo_public_key')
        TF_VAR_private_key  = credentials('mongo_private_key')
        TF_VAR_org_id       = credentials('mongo_org_id')
        TF_VAR_db_user      = credentials('mongo_db_user')
        TF_VAR_db_password  = credentials('mongo_db_password')
        TF_VAR_project_name = "terraform-jenkins-mongo-automation"
        TF_VAR_access_cidr  = "0.0.0.0/0"
        TF_VAR_region       = "ap-south-1"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Akilesh-GA/TerraformAutomation.git'
            }
        }

        stage('Terraform Init') {
            steps {
                bat '"D:\\Terraform\\terraform.exe" init'
            }
        }

        stage('Terraform Plan') {
            steps {
                bat '"D:\\Terraform\\terraform.exe" plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                bat '"D:\\Terraform\\terraform.exe" apply -auto-approve tfplan'
            }
        }
    }

    post {
        success {
            echo '✅ MongoDB Atlas infrastructure deployed successfully!'
        }
        failure {
            echo '❌ Terraform apply failed! Check above logs for details.'
        }
    }
}
