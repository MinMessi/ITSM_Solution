def IMG = "192.168.100.12/ritus-total/ritus-total:v-"
def KC = "/usr/local/bin/kubectl --kubeconfig=/home/jenkins/acloud-client.conf"

pipeline {
  
  environment {
    registry = "MinMessi/ritus-total"
    dockerImage = "${IMG}${BUILD_NUMBER}"
  }
  agent any
  
  stages {
    stage('Checkout') {
      steps {
        echo "Checkout Source START"
        git branch: 'main', url: 'https://github.com/MinMessi/ritus-total.git'
        echo "Checkout Source END"
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          echo "Build image START $BUILD_NUMBER"
          sh "docker build --no-cache -t ${dockerImage} ."
          echo "Build image END"
        }
      }
    }

   stage('Push Image') {
     environment {
               registryCredential = 'harbor'
     }
     steps{
      script {
        echo "Push Image START"
          sh "docker login 192.168.100.12 -u admin -p Unipoint11"
          sh "docker push ${dockerImage}"
        }
        echo "Push Image END"
      }
    }
    
    stage('Deploy to Kubernetes') {
      steps {
        script {
         echo "Create Deployment.yaml"
         writeFile file: 'ritus-total-deployment.yaml', text: """
         apiVersion: apps/v1
         kind: Deployment
         metadata:
           name: ritus-total
           namespace: ritus-total
         spec:
           replicas: 1
           selector:
             matchLabels:
               app: ritus-total
               version: v1
           template:
             metadata:
               annotations:
                 sidecar.istio.io/inject: 'true'
               labels:
                 app: ritus-total
                 version: v1
             spec:
               restartPolicy: Always
               containers:
                 - name: ritus-total
                   image: ${dockerImage}
                   ports:
                     - containerPort: 8088
                       protocol: TCP
         """
         echo "Create Deployment.yaml END"
        }
        script {
          echo "Delete Existing Deployment"
          sh "${KC} delete deployment ritus-total -n ritus-total"
          echo "Delete END"
        }
        script {
          echo "Deploy App Start"
          sh "${KC} create -f ritus-total-deployment.yaml"
          sh "${KC} set image deployment/ritus-total ritus-total=${dockerImage} -n ritus-total"
          echo "Deploy App END"
        }
      }
    }
  }
}
