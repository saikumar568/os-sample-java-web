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
        sh 'mvn package'
      }
    }
    stage('test') {
      parallel {
        stage('test') {
          steps {
            sh 'mvn test'
          }
        }
        stage('sonar-test') {
          steps {
            sh 'mvn sonar::sonar'
          }
        }
      }
    }
    stage('Artifactory') {
      steps {
        archiveArtifacts '#abc'
      }
    }
    stage('Deploy') {
      steps {
        sh '#!/bin/bash'
      }
    }
  }
}