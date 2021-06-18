job('learning jenkins-groovy') {
    
    scm {
        git('https://github.com/si3mshady/jenkins_job_pipeline_practice', 'main')       

    }

    steps {
        shell("""        
        python3 -m venv si3mshady 
        source si3mshady/bin/activate
        pip install aws-sam-cli
        sam build template.yaml           
        """)
    }
}
}