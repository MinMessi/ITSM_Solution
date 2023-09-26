def IMG = "192.168.100.12/sellers/sellers:v-"
def KC = "/usr/local/bin/kubectl --kubeconfig=/home/jenkins/acloud-client.conf"

pipeline {
  
  environment {
    registry = "lee-code712/sellers"
    dockerImage = "${IMG}${BUILD_NUMBER}"
  }
  agent any
  
  stages {
    stage('Checkout') {
      steps {
        echo "Checkout Source START"
        git branch: 'main', url: 'https://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@github.com/lee-code712/sellers.git'
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
         writeFile file: 'sellers-deployment.yaml', text: """
         apiVersion: apps/v1
         kind: Deployment
         metadata:
           name: sellers
           namespace: sellers
         spec:
           replicas: 1
           selector:
             matchLabels:
               app: sellers
               version: v1
           template:
             metadata:
               annotations:
                 sidecar.istio.io/inject: 'true'
               labels:
                 app: sellers
                 version: v1
             spec:
               restartPolicy: Always
               containers:
                 - name: sellers
                   image: ${dockerImage}
                   ports:
                     - containerPort: 8000
                       protocol: TCP
         """
         echo "Create Deployment.yaml END"
        }
        script {
          echo "Delete Existing Deployment"
          sh "${KC} delete deployment sellers -n sellers"
          echo "Delete END"
        }
        script {
          echo "Deploy App Start"
          sh "${KC} create -f sellers-deployment.yaml"
          sh "${KC} set image deployment/sellers sellers=${dockerImage} -n sellers"
          echo "Deploy App END"
        }
      }
    }
  }
}
