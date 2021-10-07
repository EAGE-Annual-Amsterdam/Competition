#!/bin/bash
cd /competition

if test -f autotest.sgy; then
    mkdir test_participant
    cd test_participant
    touch submission.csv
fi
