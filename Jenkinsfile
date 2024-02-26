pipeline {
    agent any 
    
    tools{
        jdk 'jdk17'
        maven 'maven3'
    }
    environment {
        SCANNER_HOME=tool 'sonar-scanner'
    }

     stages{
        
        stage("Git Checkout"){
            steps{
                git branch: 'master', changelog: false, poll: false, url: 'https://github.com/quachtohai/firstjobapp.git'
            }
        }
        
        stage("Compile"){
            steps{
                sh "mvn clean compile"
            }
        }
        
        stage("Build"){
            steps{
                sh " mvn clean install"
            }
        }
        stage("Docker Build & Push"){
            steps{
                script{
                   withDockerRegistry(credentialsId: 'docker', toolName: 'docker') {
                        
                        sh "docker build -t image2 ."
                        sh "docker tag image2 quachtohai/pet-clinic1234:latest "
                        sh "docker push quachtohai/pet-clinic1234:latest "
                    }
                }
            }
        }
        
        
        stage("Deploy with docker"){
            steps{
                sh "docker run -p 8082:8082 quachtohai/pet-clinic1234:latest "
            }
        }
        


     }
}

  
    
         


        
     

