#!/bin/bash
if [[ "$WTL_DOMAIN_NAME" == "" ]]
then
  echo "Missing WTL_DOMAIN"
  exit 1
fi
# list of supported subdomain
langs="it en de es fr pt sv ca meta pool"
{
 echo "worker_heartbeat_timeout: 300000"
 echo "logging:"
 echo " level: info"
 echo "services:"
 echo "- module: lib/index.js"
 echo "  entrypoint: apiServiceWorker"
 echo "  conf:"

 echo "   mwApis:"
 for lang in $langs ; do
   echo "   - uri: 'http://$lang.$WTL_DOMAIN_NAME/api.php'"
   echo "     domain: '$lang.$WTL_DOMAIN_NAME'"
 done
 echo "   loadWMF: true"
 echo "   useSelser: true"
} > /parsoid/config.yaml

cd /parsoid

exec npm start
