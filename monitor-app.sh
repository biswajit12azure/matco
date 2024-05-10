#!/bin/bash

# Check the app health
if curl -s -w '%{http_code}' -o /dev/null "http://localhost:19542/api/ct/actuator/health" | grep -q "200"; then
  echo "Curl succeeded with 200 OK HTTP status code."
else
  echo "Curl failed or returned a non-200 HTTP status code."
  # Start the app if health check fails
  javaw -jar /c/jenkins-apps/springboot/commercetools-api-integration/run/commercetools-api-integration*.jar --spring.config.location=/c/jenkins-apps/springboot/commercetools-api-integration/run/config/application.properties &
fi
