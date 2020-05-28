#!/bin/bash
cd -- "$(dirname "$BASH_SOURCE")"
$PWD/processing-java --sketch=$PWD/MetaJavascript/ --force --run
