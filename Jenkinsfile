node('docker') {
  stage('Checkout'){
    checkout scm
  }
  stage('Production Build'){
    if (env.BRANCH_NAME == 'master'){
    withCredentials([ usernamePassword(credentialsId: 'dockerhubess',usernameVariable: 'docker_user',passwordVariable: 'docker_password' )]) {
      sh 'docker login -u essdmscdm -p $docker_password '
      sh "docker pull matrixdotorg/synapse:latest"
      sh "docker tag matrixdotorg/synapse:latest dacat/synapse:latest"
      sh "docker push dacat/synapse:latest"
    }
    }
  }
}
