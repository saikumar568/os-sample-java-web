pipeline {
  agent any
  stages {
    stage('checkout') {
      steps {
        bat '#'
      }
    }
    stage('build') {
      steps {
        bat 'mvn install'
      }
    }
    stage('SonarQube') {
      steps {
        bat 'mvn sonar:sonar'
      }
    }
    stage('unit-test') {
      steps {
        bat 'mvn test'
      }
    }
  }
}