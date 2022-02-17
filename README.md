# keycloak-with-infinispan
keycloak Dockerfile(with infinispan)

## quickstart

### network create
```
docker network create insp-work
```

### infinispan config

1. infinispan start
```console
docker run --name insp-srv --net insp-work -dp 11222:11222 -e USER="admin" -e PASS="password" infinispan/server:13.0
```

2. Using web console to create cache
* [http://localhost:11222](http://localhost:11222)


- Creating Cache
  - work
  - sessions
  - offlineSessions
  - offlineClientSessions
  - loginFailures
  - clientSessions
  - authenticationSessions
  - actionTokens


- Settings to use when creating Chache
```configration
{
  "distributed-cache": {
    "mode": "SYNC",
    "encoding": {
      "media-type": ""application/x-jboss-marshalling"
    },
    "statistics": true
  }
}
```

### keycloak start
```console
docker run -itP --net insp-work --name kc -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin kc-insp -Dremote.cache.host=insp-srv
  moremagic/keycloak-with-infinispan
```

# references

- [Keycloak Server Insallation](https://www.keycloak.org/docs/latest/server_installation/)

