#!/bin/bash
for f in /usr/local/bin/provisioners/*.sh; do
  bash "$f" -H || break
done

supervisord -c /etc/supervisor/conf.d/supervisord.conf
