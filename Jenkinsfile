pipeline {
	agent any	
  tools { 
        maven 'maven' 
	jdk 'jdk'
	 git 'git'
        
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
         /*slackSend channel: '#jenkins',
				color: 'good',
				message: "Build Started - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)",
				baseUrl: "https://github.com/Ajayvarma8142/os-sample-java-web.git",
				token:"jkdsnkjxnkaansaaaawinkjldlssks" */
         /*sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
		    export SONAR_RUNNER_HOME=/opt/sonarrunner
                    echo ${SONAR_RUNNER_HOME}
                ''' */
	      //bat 'set JAVA_HOME = "C:\Program Files\Java\jdk1.8.0_181"'
         bat 'mvn clean install'
      }
    }
    stage('test') {
	// agent {label 'master'}   
      steps {
        parallel(
          "code analyze": {
           /* tool name: 'SonarRunner', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
            withSonarQubeEnv('Sonar') { // from SonarQube servers > name
    		//sh "${HOME}/.jenkins/tools/hudson.plugins.sonar.SonarRunnerInstallation/Sonar/bin/sonar-runner -Dsonar.projectName=ecommerce -Dsonar.projectVersion=1.0 -Dsonar.projectKey=ecommerce -Dsonar.sources=src/main/java -Dsonar.java.binaries=target/classes"
             sh "${SONAR_RUNNER_HOME}/bin/sonar-runner -Dsonar.projectName=ecommerce -Dsonar.projectVersion=1.0 -Dsonar.projectKey=ecommerce -Dsonar.sources=src/main/java -Dsonar.java.binaries=target/classes"		    
            }*/
		  withSonarQubeEnv('SonarQube') {
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
    /*stage('dev test') {
	//agent {label 'qa'}   
      steps {
	parallel(
		"smoke test":{
	//bat 'rmdir /S /Q ecommerce-smoke-uitests'	
        //bat 'git clone https://github.com/Ajayvarma8142/os-sample-java-web.git'
       // bat 'cd ecommerce-smoke-uitests && gradlew cucumber -Pfeatures=src/test/resources/gradle/cucumber/smoke report --continue'
	//cucumber fileIncludePattern: 
	//},
	//"api test":{
	//	bat 'rmdir /S /Q ecommerce-apitests'
	//bat 'git clone https://github.com/Ajayvarma8142/os-sample-java-web.git'
       // bat 'cd ecommerce-apitests && gradlew cucumber -Pfeatures=src/test/resources/gradle/cucumber report --continue'
	//cucumber fileIncludePattern: 
	}) 
      }
    }*/
   // stage('qa-deploy') {
	//agent {label 'qa'} 
    //  steps {
        
     //   bat 'mvn package'
     // }
  //  }
    /*stage('qa tests') {
	//agent {label 'qa'}
      steps {
	parallel(
		"ui tests":{
        //bat 'rmdir /S /Q ecommerce-uitests'
       // bat 'git clone https://github.com/Ajayvarma8142/os-sample-java-web.git'
       
      //bat 'cd ecommerce-uitests && gradlew cucumber -Pfeatures=src/test/resources/gradle/cucumber report --continue'
	//cucumber fileIncludePattern: 
	},
		//"performance tests":{
			//bat 'rmdir /S /Q Jmeter'
        		//bat 'git clone https://github.com/Ajayvarma8142/os-sample-java-web.git'	
			//bat 'cd Jmeter && run.bat'
			//perfReport compareBuildPrevious: true, modeOfThreshold: true, percentiles: '0,50,90,100', sourceDataFiles: 
		})
      }
    }
 
  }*/
  /*post{
  	always{
  		slackSend channel: '#jenkins',
				color: 'good',
				message: "The pipeline completed ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)",
				baseUrl: "https://github.com/Ajayvarma8142/os-sample-java-web.git",
				token:"HFi8BU1ac67whUX4kc9Ka1Z7"
  	 publishHTML (target: [
      allowMissing: false,
      alwaysLinkToLastBuild: false,
      keepAll: true,
      reportDir: 'https://github.com/Ajayvarma8142/os-sample-java-web.git',
      reportFiles: 'overview-features.html',
      reportName: "Smoke Test Report"
    ])
    
    publishHTML (target: [
      allowMissing: false,
      alwaysLinkToLastBuild: false,
      keepAll: true,
      reportDir: 'https://github.com/Ajayvarma8142/os-sample-java-web.git',
      reportFiles: 'overview-features.html',
      reportName: "Regression Test Report"
    ])*/
   
  	}
  }

