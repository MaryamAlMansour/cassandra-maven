node {
  stage('Cloning repository from Git') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }
  stage('SonarQube analysis') {
    withSonarQubeEnv(credentialsId: 'ca9108e574db4f6fba557413a7edcb29efdf65f0', installationName: 'sonarqube-jenkins') { // You can override the credential to be used
      sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.6.0.1398:sonar'
    }
  }
}
