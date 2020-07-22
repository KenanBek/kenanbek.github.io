---
layout: article
permalink: /digitalocean-kubernetes-nginx-ingress
title: "NGINX Ingress confiugration for DigitialOcean K8S Cluster"
date: 2020-07-22 23:06:00 +0200
lastmod: 2020-07-22 23:06:00 +0200
categories: Posts
tags: [k8s, kubernetes, nginx, ingress, service, configuraiton]
sitemap:
    priority: 1
    changefreq: weekly
comments: true
todo: []
---

NGINX Ingress configuration for DigitalOcean's k8s cluster.

# Install nginx-ingress

```
helm install nginx-ingress stable/nginx-ingress --set service.type=LoadBalancer --namespace <YOUR_NAMESPACE>
```

# Ingress configuration

```
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: codekn-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: codekn.com
    http:
      paths:
      - path: /
        backend:
          serviceName: codekn-service
          servicePort: 8081
      - path: /api
        backend:
          serviceName: codekn-service
          servicePort: 8082
  - host: dev.codekn.com
    http:
      paths:
        - path: /
          backend:
            serviceName: codekn-service
            servicePort: 8082
        - path: /api
          backend:
            serviceName: codekn-service
            servicePort: 8082
```

# Service configuration

```
apiVersion: v1  
kind: Service
metadata:
  name: codekn-service
  labels:
    app: codekn
spec:
  selector:
    app: codekn
  ports:
  - name: website
    port: 8081
    targetPort: 8081
  - name: api
    port: 8082
    targetPort: 8082
```