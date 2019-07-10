node('docker') {
  stage('Checkout'){
    checkout scm
  }
  stage('Production Build'){
    if (env.BRANCH_NAME == 'master'){
    withCredentials([ usernamePassword(credentialsId: 'dockerhubess',usernameVariable: 'docker_user',passwordVariable: 'docker_password' )]) {
      def IMAGE_ID = sh ( script: 'git rev-parse HEAD',returnStdout: true).trim()
      sh 'docker login -u essdmscdm -p $docker_password '
      sh "docker pull matrixdotorg/synapse:latest"
      sh "docker tag matrixdotorg/synapse:latest dacat/synapse:${IMAGE_ID}"
      sh "docker tag matrixdotorg/synapse:latest dacat/synapse:latest"
      echo "Git image id : ${IMAGE_ID}"
      sh "docker push dacat/synapse:${IMAGE_ID}"
      sh "docker push dacat/synapse:latest"
    }
    }
  }
}
