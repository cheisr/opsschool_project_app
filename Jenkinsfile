node("linux") {
   def DockerImage = "project-image"
   
   stage('Clone repository') {
      git branch: 'master',
      url: 'https://github.com/cheisr/opsschool_project_app.git' 
      checkout scm
   }
  

   stage('Build image') {
       app = docker.build("cheisr/opsschool_project")
   }
   
   stage('Test container') {
       response = app.withRun("-p 8181:8181"){
           sh(script: "sleep 10; curl 127.0.0.1:8181", returnStdout: true)
       }
   }

   stage('Push image') {
       withDockerRegistry(registry:[
               url: '',
               credentialsId: 'dockerhub'
               ]){
           app.push()
       }
   }

   stage('Deploy') {
    sh "aws eks --region us-east-1 update-kubeconfig --name opsschool_eks_cheisr"
    sh "kubectl apply -f K8s_LB.yml"
    sh "kubectl apply -f k8s_deployment.yml"
   }
}
