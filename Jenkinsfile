pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(url: 'https://github.com/Ajayvarma8142/os-sample-java-web', branch: 'master', credentialsId: 'Ajayvarma8142')
      }
    }
    stage('Build') {
      steps {
        echo 'build'
        bat 'mvn clean package'
      }
    }
    stage('Test') {
      parallel {
        stage('Test') {
          steps {
            echo 'Tests'
          }
        }
       // stage('Junit') {
        //  steps {
         //   echo 'junit tests'
          //  junit 'build/reports/**/*.xml'
         // }
       // }
       // stage('cucumber') {
        //  steps {
          //  echo 'cucumber test cases'
        //  }
       // }
      }
    }
    stage('test') {
      steps {
        parallel(
          "code analyze": {
            tool name: 'SonarScanner', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
            withSonarQubeEnv('SonarScanner') { // from SonarQube servers > name
    		//sh "${SonarScanner}/bin/sonar-scanner"
		    bat "C:/sonarqube-7.7/bin/windows-x86-64/sonar-runner -Dsonar.projectName=os-sample-java-web -Dsonar.projectVersion=1.0 -Dsonar.projectKey=os-sample-java-web -Dsonar.sources=src/main/webapp -Dsonar.java.binaries=target/classes"
            }
          },
          "unit tests": {
           sh 'mvn test'
            
          }
        )
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
