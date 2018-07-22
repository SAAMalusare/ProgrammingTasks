node {
	stage ('Code Checkout'){
	   echo 'Build Code'
	}
	stage ('Building Code'){
	   echo 'Build Code'
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