pipeline {
    agent any

    environment {
        TF_VAR_public_key   = credentials('wktuwdcd')   
        TF_VAR_private_key  = credentials('bc51f079-ba58-46a6-8090-6b934048688f')  
        TF_VAR_org_id       = credentials('66e862049dd1012687231d68')       
        TF_VAR_db_user      = credentials('akileshga')      
        TF_VAR_db_password  = credentials('@kil_1466')
        TF_VAR_project_name = 'terraform-jenkins-mongo-automation'
        TF_VAR_access_cidr  = '0.0.0.0/0'
        TF_VAR_region       = 'AP_SOUTH_1'   
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
