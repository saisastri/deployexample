pipeline {
  agent any
  stages {
    stage('build/script') {
      steps {
        sh '''ping-c 2 local host
'''
      }
    }
    stage('Test') {
      steps {
        echo 'ping-c 2 local host'
        sh '''ping-c 3 local host
'''
      }
    }
    stage('Deploy') {
      steps {
        sh '''ping-c 2 local host
'''
      }
    }
  }
}