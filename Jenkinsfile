pipeline {
  agent {
    node {
      label 'docker'
    }

  }
  stages {
    stage('generate C++ files') {
      parallel {
        stage('generate C++ files') {
          agent {
            node {
              label 'docker'
            }

          }
          steps {
            sh '''#!/bin/sh
echo "Host is as follows"
uname -a
cat /etc/*-release
# Install needed packages
docker run --rm -v "$PWD":/usr/src/proto_defs \\
-w /usr/src/proto_defs \\
fedora:28 bash -c \\
\'uname -a && \\
 cat /etc/*-release && \\
 dnf install -y gcc-c++ protobuf-compiler protobuf-devel ninja-build cmake && \\
 mkdir -p build && cd build && \\
cmake -GNinja .. && ninja\''''
          }
        }
        stage('Generate Go files') {
          agent {
            node {
              label 'docker'
            }

          }
          steps {
            sh '''#!/bin/sh
echo "Host is as follows"
uname -a
cat /etc/*-release
# Install needed packages
docker run --rm -v "$PWD":/usr/src/proto_defs \\
-w /usr/src/proto_defs \\
fedora:28 bash -c \\
\'uname -a && \\
 cat /etc/*-release && \\
 dnf install -y gcc-c++ protobuf-compiler protobuf-devel golang-googlecode-goprotobuf ninja-build cmake && \\
 ./generate_protos.sh\''''
          }
        }
      }
    }
  }
}