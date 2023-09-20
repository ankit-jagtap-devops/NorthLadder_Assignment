pipeline {
    agent any

    stages {
       
        stage('Checkout') {
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ankit-jagtap-devops/NorthLadder_Assignment.git']]])
            }
        }

        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t ankitjagtap/northladder_assignment .'
                }
            }
        }

        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u ankitjagtap -p ${dockerhubpwd}'

}
                   sh 'docker push ankitjagtap/northladder_assignment'
                }
            }
        }

        stage('Deploy to EKS') {
            steps {
                // Set up Kubernetes context
                withKubeConfig(
                    credentialsId: 'k8scredentials', 
                    serverUrl: 'https://your-eks-api-server-url'
                ) {
                    // Deploy using Helm
                    sh '''
                        helm upgrade --install nodejs-app ./my-app/Charts.yaml \
                            --namespace default \
                            --values ./my-app/values.yaml
                    '''
                }
            }
        }
    }
}