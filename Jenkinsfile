pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(url: 'https://github.com/santosh52krishna/os-sample-java-web.git', branch: 'master', credentialsId: 'santosh52krishna')
      }
    }
    stage('Build') {
      steps {
        echo 'build'
        sh '''#mvn clean -Dmaven.test.failure.ignore=true install
mvn clean package'''
      }
    }
    stage('Test') {
      parallel {
        stage('Test') {
          steps {
            echo 'Tests'
          }
        }
        stage('Junit') {
          steps {
            echo 'junit tests'
            junit 'build/reports/**/*.xml'
          }
        }
        stage('cucumber') {
          steps {
            echo 'cucumber test cases'
          }
        }
      }
    }
    stage('Dev') {
      steps {
        echo 'Dev env'
      }
    }
    stage('Staging') {
      steps {
        echo 'stage env'
      }
    }
    stage('Production') {
      steps {
        echo 'prod env'
      }
    }
  }
}