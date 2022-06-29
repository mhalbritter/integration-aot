#!/usr/bin/env bash

set -euo pipefail

./mvnw clean package
java -Dspring.aot.enabled=true -jar target/integration-aot-0.0.1-SNAPSHOT.jar
