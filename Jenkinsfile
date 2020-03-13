node("linux") {
   def DockerImage = "project-image"
   
   stage('Clone repository') {
      git branch: 'master',
      url: 'https://github.com/cheisr/flask-http.git' 
      checkout scm
   }
  

   stage('Build image') {
       app = docker.build("cheisr/opsschool_project", "python_app/")
   }
   
   stage('Test container') {
       response = app.withRun("-p 8080:5000"){
           sh(script: "sleep 10; curl 127.0.0.1:8080", returnStdout: true)
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
    sh "aws eks --region us-east-1 update-kubeconfig --name opsschool_eks_cheisr --role-arn arn:aws:iam::212353307140:policy/describe_eks"
    sh "kubectl apply -f K8s/project_app_pod_k8s.yml"
   }