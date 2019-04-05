mvn tomcat8::run
bat 'cp C:/Program Files (x86)/Jenkins/jobs/testing/branches/master/workspace/target/ROOT.war C:/Program Files/Apache Software Foundation/Tomcat 8.5/webapps'
cd  C:/Program Files/Apache Software Foundation/Tomcat 8.5/bin
catalina.bat shutdown
catalina.bat startup
