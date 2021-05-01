#!/bin/bash

# Get flutter
git clone https://github.com/flutter/flutter.git
FLUTTER=flutter/bin/flutter

# Configure flutter
FLUTTER_CHANNEL=master
FLUTTER_VERSION=v2.12.3

# Build flutter for web
$FLUTTER build web

echo "OK"