pipeline {
  agent {
    node {
      label 'docker'
    }

  }
  stages {
    stage('generate proto files') {
      agent {
        node {
          label 'docker'
        }

      }
      steps {
        sh '''#!/bin/sh

uname -a
cat /etc/*-release

# Install needed packages
docker run --rm -v "$PWD":/usr/src/myapp \\
-w /usr/src/myapp \\
gcc:latest bash -c \\
\'apt-get install -y protobuf-dev && \\
 apt-get install -y protobuf-compiler-grpc && \\
mkdir build && cd build && \\
cmake .. && make -j\''''
      }
    }
  }
}