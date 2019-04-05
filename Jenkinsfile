pipeline {
  agent any
  stages {
    stage('checkout') {
      steps {
        git(url: 'https://github.com/Ajayvarma8142/os-sample-java-web.git', branch: 'master', credentialsId: 'Ajayvarma8142')
      }
    }
    stage('build') {
      steps {
        bat 'mvn clean package'
      }
    }
    stage('test') {
      parallel {
        stage('test') {
          steps {
            bat 'mvn test'
          }
        }
        stage('sonar-test') {
          steps {
            bat 'mvn sonar:sonar'
          }
        }
      }
    }
    stage('Deploy') {
      steps {
        bat 'bat \'cp target/ROOT.war TOMCAT_DIRECTORY/webapps/\''
      }
    }
  }
}