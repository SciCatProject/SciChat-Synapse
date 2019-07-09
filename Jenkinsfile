node('docker') {
  stage('Checkout'){
    checkout scm
  }
  stage('Production Build'){
    if (env.BRANCH_NAME == 'master'){
    withCredentials([ usernamePassword(credentialsId: 'dockerhubess',usernameVariable: 'docker_user',passwordVariable: 'docker_password' )]) {
      sh 'docker login -u essdmscdm -p $docker_password '
      def IMAGE_ID = sh ( script: 'git rev-parse HEAD',returnStdout: true).trim()
      sh "docker build --file synapse/docker/Dockerfile  . --tag dacat/synapse:latest -t dacat/synapse:${IMAGE_ID}"
      echo "Git image id : ${IMAGE_ID}"
      sh "docker push dacat/synapse:${IMAGE_ID}"
      sh "docker push dacat/synapse:latest"
      sh "docker rmi dacat/synapse:${IMAGE_ID}"
    }
    }
  }
}
