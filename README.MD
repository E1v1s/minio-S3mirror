This solution created to mirror minio bucket to S3, but also could be used to sync, backup and mirror betwen minio buckets.

Env variables you should know:

Vars with source used to create source allias.
```
SOURCE_ALIAS_NAME
SOURCE_ENDPOINT
SOURCE_ACCESS_KEY
SOURCE_SECRET_KEY
```
This variables at all form command mc alias set
```
$SOURCE_ALIAS_NAME $SOURCE_ENDPOINT $SOURCE_ACCESS_KEY $SOURCE_SECRET_KEY which set allias of source mirror bucket
```
Vars with destination used to create source allias
```
DESTINATION_ALIAS_NAME
DESTINATION_ENDPOINT
DESTINATION_ACCESS_KEY
DESTINATION_SECRET_KEY
```
This variables at all form command mc alias set $DESTINATION_ALIAS_NAME
```
$DESTINATION_ENDPOINT $DESTINATION_ACCESS_KEY $DESTINATION_SECRET_KEY hich set allias of destination mirror bucket
```
This var you can use to pereodically sync source with destination ( with --remove arg)
https://min.io/docs/minio/linux/reference/minio-mc/mc-mirror.html#mc.mirror.-remove
EXTRA_ARG

K8s manifest example:
# to use S3 you need service accout with necessary permissions
```
---
apiVersion: v1
data:
  SOURCE_ACCESS_KEY: plaseherebase64encodedvar
  SOURCE_SECRET_KEY: plaseherebase64encodedvar
  DESTINATION_ACCESS_KEY: plaseherebase64encodedvar
  DESTINATION_SECRET_KEY: plaseherebase64encodedvar
kind: Secret
metadata:
  name: minio-secrets
  namespace: default
type: Opaque

---
apiVersion: batch/v1
kind: CronJob
metadata:
  labels:
    app: minio-backup
  name: minio-backup
  namespace: default
spec:
  concurrencyPolicy: Forbid
  failedJobsHistoryLimit: 2
  jobTemplate:
    spec:
      template:
        metadata:
          labels:
            app: minio-backup
        spec:
          containers:
          - args:
            - /run.sh
            command:
            - /bin/sh
            env:
            - name: DESTINATION_ALIAS_NAME
              value: myS3
            - name: DESTINATION_ENDPOINT
              value: https://YOURBUCKET.s3.eu-central-1.amazonaws.com
            - name: SOURCE_ALIAS_NAME
              value: minio-copy
            - name: SOURCE_ENDPOINT
              value: http://SERVICENAME:APIPORT
            envFrom:
            - secretRef:
                name: minio-secrets
            image: PATHTODOCKERIMAGE
            imagePullPolicy: IfNotPresent
            name: minio-backup
            resources: {}
          dnsPolicy: ClusterFirst
          restartPolicy: Never
          schedulerName: default-scheduler
          securityContext: {}
          terminationGracePeriodSeconds: 30
  schedule: 30 9 * * 3
  successfulJobsHistoryLimit: 2
  suspend: false
```
DOCKER:
Also it's possible to use or test ttthis solution with simple dockerr command:
```
docker run -e SOURCE_ALIAS_NAME=minio-copy -e SOURCE_ENDPOINT=http://minio-endpoint:APIPORT -e SOURCE_ACCESS_KEY=key -e SOURCE_SECRET_KEY=password -e DESTINATION_ALIAS_NAME=myS3 -e DESTINATION_ENDPOINT=https://YOURBUCKET.s3.eu-central-1.amazonaws.com -e DESTINATION_ACCESS_KEY=S3accessKey -e DESTINATION_SECRET_KEY=S3SecretKey image
```
