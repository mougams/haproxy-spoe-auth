#!/bin/bash

go build -mod=vendor -o /tmp/haproxy-ldap-auth . && /tmp/haproxy-ldap-auth -ldap-url ${LDAP_URL} -ldap-userdn ${LDAP_USERDN} -ldap-password ${LDAP_PASSWORD} -ldap-base-dn ${LDAP_BASE_DN} -ldap-user-filter ${LDAP_USER_FILTER}