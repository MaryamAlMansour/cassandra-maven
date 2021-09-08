node {
  stage('Cloning repository from Git') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }
  stage('Compile-Package'){
      // Get maven home path
      def mvnHome =  tool name: 'maven-3', type: 'maven'   
      sh "${mvnHome}/bin/mvn package"
   }
   
  stage('SonarQube Analysis') {
        def mvnHome =  tool name: 'maven-3', type: 'maven'
        withSonarQubeEnv('sonarqube-jenkins') { 
          sh "${mvnHome}/bin/mvn sonar:sonar"
        }
    }
}
