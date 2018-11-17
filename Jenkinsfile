node {
   def mvnHome
   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      git 'https://github.com/thedevopsdays/Demo-Repo.git'
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.           
      mvnHome = tool 'M3'
   }
   stage('Build') {
      // Run the maven build
          // next stage
      if (isUnix()) {
         sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean package"
      } else {
         bat(/"${mvnHome}\bin\mvn" -Dmaven.test.failure.ignore clean package/)
      }
      
   }
   
   stage('CodeQuality') { // for display purposes
      // Get some code from a GitHub repository
      sh "chmod +x -R ${env.WORKSPACE}/"
      try {
      sh '/var/lib/jenkins/workspace/pipeline/pmd.sh'
      }
      catch (err){
    echo "some stage got failed"
}
   
   stage('Build Image'){
       
       sh 'sudo docker build -t apacheimagelatest .'
       
   }
   
   stage('Tag Image'){
       sh 'sudo docker tag apacheimagelatest thedevopsdays/demorepo:apacheimagelatest-tag2'
   }
   
   stage('Push Image'){
       withCredentials([string(credentialsId: 'docker-PWD', variable: 'dockerHubPWD')]) {
    // some block
       sh " sudo docker login -u thedevopsdays -p ${dockerHubPwd} "
       } 
    sh  'sudo docker push thedevopsdays/demorepo:apacheimagelatest-tag2'
   }  
   
   
}
