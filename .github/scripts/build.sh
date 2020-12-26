#!/bin/bash

set -eo pipefail

xcodebuild -workspace Soyeon.xcworkspace \
            -scheme Soyeon \
            -destination platform=iOS\ Simulator,OS=14.2,name=iPhone\ 11 \
