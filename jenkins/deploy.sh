echo SPRING_PROFILES_ACTIVE="$SPRING_PROFILES_ACTIVE"

ls -ltr .
ls -ltr ./target

curl --fail -X POST http://localhost:19542/api/ct/actuator/shutdown || true
sleep 30s

rm -rf /c/jenkins-apps/springboot/commercetools-api-integration/run
mkdir /c/jenkins-apps/springboot/commercetools-api-integration/run
mkdir /c/jenkins-apps/springboot/commercetools-api-integration/run/config

cp ./target/commercetools-api-integration*.jar /c/jenkins-apps/springboot/commercetools-api-integration/run/
cp ./jenkins/app-config/* /c/jenkins-apps/springboot/commercetools-api-integration/run/config

ls -ltr /c/jenkins-apps/springboot/commercetools-api-integration/*

javaw -jar /c/jenkins-apps/springboot/commercetools-api-integration/run/commercetools-api-integration*.jar --spring.config.location=/c/jenkins-apps/springboot/commercetools-api-integration/run/config/ &

rm -f /c/jenkins-apps/springboot/commercetools-api-integration/monitor-app.sh
cp ./jenkins/monitor-app.sh /c/jenkins-apps/springboot/commercetools-api-integration/
