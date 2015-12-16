# es-indices
Based on Pindar/docker-es-tools but with a restricted scope and set to run as a daemon


```
docker run \
    --name es-tools \
    rucknar/es-indices \
    /elasticsearch-remove-old-indices.sh -e "$ELASTICSEARCH_ENDPOINT" -i 2
```
