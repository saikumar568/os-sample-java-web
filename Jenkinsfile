pipeline {
  agent any
  stages {
    stage('code pull') {
      steps {
        git 'https://github.com/Ajayvarma8142/os-sample-java-web.git'
        echo 'Git checkout complete'
      }
    }
    stage('build') {
      steps {
        bat 'mvn  install'
      }
    }
    stage('test') {
      parallel {
        stage('code analyze') {
          steps {
            withSonarQubeEnv('SonarQube') {
              bat 'mvn sonar:sonar'
            }

          }
        }
        stage('unit tests') {
          steps {
            bat 'mvn test'
          }
        }
      }
    }
    stage('dev-deploy') {
      steps {
        script {
          withEnv(['JENKINS_NODE_COOKIE=dontKill']){

            bat 'start runapp.bat'
            bat 'copy C:/Program Files (x86)/Jenkins/jobs/os-sample-java-web/branches/master/workspace/target/*.war C:/Program Files/Apache-Software-Foundation/Tomcat-8.5/webapps'

          }
        }

      }
    }
  }
  tools {
    maven 'maven'
    jdk 'jdk'
    git 'git'
  }
  options {
    skipDefaultCheckout(true)
  }
}