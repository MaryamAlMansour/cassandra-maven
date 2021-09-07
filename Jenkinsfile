pipeline {
  agent any

  stage('Clone the Git') {
    git 'https://github.com/MaryamAlMansour/cassandra-maven.git'
  }
  stage('SonarQube analysis') {
    def scannerHome = tool 'sonarqube-server';
    withSonarQubeEnv('sonarqube-server') {
      sh "${scannerHome}/bin/sonar-scanner" \
        -Dsonar.projectKey=belt-exam3-sonarqube-jenkins \
        -Dsonar.host.url='http://54.196.235.27:9000' \
        -Dsonar.login=admin \
        -Dsonar.password=Sonar-docker \
    }
  }
}
