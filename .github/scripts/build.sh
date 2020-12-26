#!/bin/bash

set -eo pipefail

xcodebuild -project Soyeon.xcodeproj \
            -scheme Soyeon \
            -destination platform=iOS\ Simulator,OS=14.2,name=iPhone\ 11 \
