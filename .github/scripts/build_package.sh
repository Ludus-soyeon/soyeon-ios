#!/bin/bash 

set -eo pipefail

cd Soyeon-package; swift build --parallel; cd..
