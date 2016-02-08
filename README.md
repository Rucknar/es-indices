# es-indices
Based on imperialwicket's elasticsearch-logstash-index-mgmt script,  but with a restricted scope and set to run as a docker container in a daemon mode. 


```
docker run \
    --name es-tools \
    rucknar/es-indices \
    /elasticsearch-remove-old-indices.sh -e "$ELASTICSEARCH_ENDPOINT" -i 2
```
