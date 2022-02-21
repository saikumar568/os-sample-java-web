pipeline {
  agent any
  stages {
    stage('checkout') {
      steps {
        git(url: 'https://github.com/Ajayvarma8142/os-sample-java-web.git', branch: 'master')
      }
    }
    stage('build') {
      steps {
        sh 'mvn install'
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
    stage('Deploy') {
      steps {
        bat 'runapp.bat'
      }
    }
  }
}
