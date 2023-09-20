pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your code from your Git repository
                git branch: 'main', url: 'https://github.com/yourusername/your-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build a Docker image for your Node.js application
                script {
                    dockerImage = docker.build('your-docker-image-tag:latest', '-f Dockerfile .')
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                // Push the Docker image to a container registry (e.g., Docker Hub, Azure Container Registry, etc.)
                script {
                    docker.withRegistry('https://registry.example.com', 'your-registry-credentials') {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                // Deploy your application to Kubernetes
                sh '''
                    kubectl config use-context your-kube-context
                    kubectl apply -f kubernetes/deployment.yaml
                    kubectl apply -f kubernetes/service.yaml
                    kubectl apply -f kubernetes/ingress.yaml
                '''
            }
        }
    }
}