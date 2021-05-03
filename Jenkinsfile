pipeline {
    agent any
    environment {
        registry = 'anyulled/capstone'
        registryCredential = 'dockerhub'
    }
    stages {
        stage('Build App') {
            steps {
                println('install dependencies')
                sh '''
                 sudo python3 -m venv venv
                 sudo  . venv/bin/activate
                 sudo make install
                 # Install hadolint
                 sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64
                 sudo  chmod +x /bin/hadolint

                '''
            }
        }
        stage('Test') {
            steps {
                println('run lint')
                sh '''
                sudo  . venv/bin/activate
                sudo  make lint           
                sudo  ./hadolint Dockerfile

                '''
            }
        }
        // stage('Check style') {
        //     steps {
        //         sh 'mvn checkstyle:checkstyle'
        //     }
        // }
        // stage('Build Image') {
        //     steps {
        //         println('publish docker image')
        //         script {
        //             dockerImage = docker.build registry + ":latest"
        //         }
        //     }
        // }
        // stage('Push Image') {
        //     steps {
        //         script {
        //             docker.withRegistry( '', registryCredential ) {
        //                 dockerImage.push()
        //             }
        //         }
        //     }
        // }
        // stage('Deploy - Kubernetes containers') {
        //     steps {
        //         println('deploy to blue container & service')
        //         withAWS(region:'eu-west-2', credentials:'aws-credentials') {
        //             sh 'aws eks update-kubeconfig --name capstonecluster --region eu-west-2'
        //             sh 'kubectl apply -f ./k8s/blue-replication-controller.yaml'
        //             sh 'kubectl apply -f ./k8s/green-replication-controller.yaml'
        //             sh 'kubectl apply -f ./k8s/blue-service.yaml'
        //         }
        //     }
        // }
        // stage('Blue/Green Deployment') {
        //     steps {
        //         input 'Deploy to Green Service?'
        //     }
        // }
        // stage('Deploy - Green Service') {
        //     steps {
        //         println('deploy container to blue service')
        //         withAWS(region:'eu-west-2', credentials:'aws-credentials') {
        //             sh 'kubectl apply -f ./k8s/green-service.yaml'
        //         }
        //     }
        // }
    }

    // post {
    //     always {
    //         archiveArtifacts artifacts: 'target/*.jar', allowEmptyArchive: true, fingerprint: true
    //         junit 'target/surefire-reports/TEST-*.xml'
    //         sh "docker rmi $registry:latest"
    //     }
    // }
}