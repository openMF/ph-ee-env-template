pipeline {
    agent any
    stages {
        stage('deploy helm chart') {
            steps {
               sh '''
cd helm/
cd ph-ee-engine
rm charts/*
helm dep up
cd -

helm package ph-ee-engine
helm repo index .

cp index.yaml ph-ee-engine-1.0.0-SNAPSHOT.tgz jenkins.mifos.io:/srv/data/helm-charts/
'''
            }
        }
    }
}
