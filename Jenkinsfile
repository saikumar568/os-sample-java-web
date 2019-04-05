pipeline {
	agent any	
  tools { 
        maven 'MAVEN' 
	jdk 'JAVA'
	 git 'GIT'
        
    }
  options {
    skipDefaultCheckout true
  }
  stages {
    stage('code pull') {
	    //agent {label 'master'}
      steps {
	//bat 'taskkill /F /IM java.exe'
	//checkout scm
        git url:'https://github.com/Ajayvarma8142/os-sample-java-web.git'
        echo 'Git checkout complete'
      }
    }
    stage('build') {
	//agent {label 'master'}    
      steps {
         
	      //bat 'set JAVA_HOME = "C:\Program Files\Java\jdk1.8.0_181"'
         bat 'mvn compile'
      }
    }
    stage('test') {
	// agent {label 'master'}   
      steps {
        parallel(
          "code analyze": {
           
		  withSonarQubeEnv('Sonar') {
      // requires SonarQube Scanner for Maven 3.2+
      bat 'mvn sonar:sonar'
    }
          },
          "unit tests": {
           bat 'mvn test'
            
          }
        )
      }
    }
    stage('dev-deploy') {
	//agent {label 'qa'}   
      steps {
        script{
        	withEnv(['JENKINS_NODE_COOKIE=dontKill']){
        		
        		bat 'start runapp.bat'
        		
        	}
        }
      }
    }
    
    stage('qa-deploy') {
	//agent {label 'qa'} 
      steps {
        
        bat 'mvn package'
      }
    }
    
  
   
  	}
  }
}
