node {
  stage('SCM') {
    git 'https://github.com/MaryamAlMansour/cassandra-maven.git'
  }
  stage('SonarQube analysis') {
    withSonarQubeEnv(credentialsId: 'ca9108e574db4f6fba557413a7edcb29efdf65f0', installationName: 'My SonarQube Server') { // You can override the credential to be used
      sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.6.0.1398:sonar'
    }
  }
}
