pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', credentialsId: 'git-hub', url: 'https://github.com/ravipatil4414/java_project.git'
            }
        }
        
        stage('Build') {
            steps {
                sh 'mvn clean package' 
            }
        }
        
        stage('Docker Build') {
            steps {
                script {
                    docker.build('my-java-app', '-f Dockerfile .') 
                }
            }
        }
        
        stage('Docker Run') {
            steps {
                script {
                    
                    sh 'docker stop my-java-app-container || true'
                    sh 'docker rm my-java-app-container || true'
                    
                    // Run Docker container in detached mode
                    sh 'docker run -p 8098:8080 --name my-java-app-container -d my-java-app'
                }
            }
        }
    }
}
