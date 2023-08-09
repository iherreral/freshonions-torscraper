#!/bin/bash

service haproxy restart
echo "harvest.sh"
/opt/torscraper/scripts/harvest.sh
echo "push_list.sh"
/opt/torscraper/scripts/push_list.sh /opt/torscraper/onions_list/onions.txt
echo "scrape.sh"
/opt/torscraper/scripts/scrape.sh
