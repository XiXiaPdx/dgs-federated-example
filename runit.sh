#!/bin/bash

# start the first program and fork it
cd shows-dgs
sh gradlew bootRun -PagentJarPath=$SHOWS_AGENT_PATH &

# store the process ID
program_1_pid=$!

# start the second program and fork it
cd ../reviews-dgs
sh gradlew bootRun -PagentJarPath=$REVIEWS_AGENT_PATH &
# store the process ID
program_2_pid=$!

# trap ctrl-c so that we can kill
# the first two programs
trap onexit INT
function onexit() {
  kill -9 $program_1_pid
  kill -9 $program_2_pid
}

# start the third program, don't fork it
sleep 12s
cd ../apollo-gateway
npm start 

