#!/bin/bash

set -eo pipefail

xcodebuild -workspace Soyeon.xcodeproj \
            -scheme Soyeon \
            -destination platform=iOS\ Simulator,OS=13.3,name=iPhone\ 11 \
	    clean test | xcpretty
