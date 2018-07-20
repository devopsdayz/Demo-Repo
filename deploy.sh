curl -v -u tomcat:tomcat --upload-file /var/lib/jenkins/workspace/pipeline/target/CubeGeneratorWeb.war http://13.126.202.140:8082/manager/text/deploy?path=/CubeGeneratorWeb&update=true
