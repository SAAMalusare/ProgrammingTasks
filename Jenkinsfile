def workspace;


node {
	stage ('Code Checkout'){
            checkout([$class: 'GitSCM', branches: [[name: '*/IntBranch']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'a32034e2-afe8-48ef-b50e-87d5f74f2be5', url: 'https://github.com/SAAMalusare/PerlTest.git']]])
    	    workspace=pwd()
	}
	stage ('Building Code'){
	   echo "${workspace}"
	   echo perl -v
	}
	stage ('Scan Code') {
	   echo 'Run FOSS scan'
	}
	stage  ('Create Docker Image'){
	   echo 'Create Docker Image and run container'
	}
	stage  ('Unit testing'){
	   echo 'Unit Testing inside container'
	}
	stage  ('Commit to registry'){
	   echo 'Commit Image to Registry'
	}
	stage ('Deploy') {
	   echo 'Deploy to UAT for accepatnce'
	}
}