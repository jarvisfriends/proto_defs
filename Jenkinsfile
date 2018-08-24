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
docker run --rm -v "$PWD":/usr/src/proto_defs \\
-w /usr/src/proto_defs \\
fedora:28 bash -c \\
\'uname -a && \\
 cat /etc/*-release && \\
 dnf install -y gcc-c++ protobuf-compiler protobuf-devel ninja-build cmake && \\
 rm -rf build && mkdir -p build && cd build && \\
cmake -GNinja .. && ninja\''''
      }
    }
  }
}
