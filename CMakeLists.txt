PROJECT(jarvis.proto_defs)
CMAKE_MINIMUM_REQUIRED (VERSION 3.9)
SET(CMAKE_CXX_FLAGS "-g -Wall -Werror")

FIND_PACKAGE ( Threads REQUIRED )

set(PROTO_FILES
jarvis/versions/Job_execution.proto
jarvis/versions/Machine_stats.proto
jarvis/versions/Application.proto
jarvis/versions/App_info.proto
proto_defs/Run_program.proto
)


# Generate the protocol buffers
INCLUDE(FindProtobuf)
#FIND_PACKAGE(Protobuf REQUIRED)
INCLUDE_DIRECTORIES(${PROTOBUF_INCLUDE_DIR})
PROTOBUF_GENERATE_CPP(PROTO_SRC PROTO_HEADER ${PROTO_FILES})
ADD_LIBRARY(proto_defs ${PROTO_HEADER} ${PROTO_SRC})
set_property(TARGET proto_defs PROPERTY CXX_STANDARD 17)



