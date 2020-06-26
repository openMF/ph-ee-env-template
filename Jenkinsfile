pipeline {
    agent any
    stages {
        stage('deploy helm chart') {
            steps {
               sh '''
cd helm/
cd ph-ee-engine
rm -f Chart.lock requirements.lock charts/*
helm dep up
cd -
rm -f ph-ee-engine-1.0.0-SNAPSHOT.tgz

helm package ph-ee-engine
helm repo index .

cp index.yaml ph-ee-engine-1.0.0-SNAPSHOT.tgz /srv/data/helm-charts/
'''
            }
        }
    }
}
