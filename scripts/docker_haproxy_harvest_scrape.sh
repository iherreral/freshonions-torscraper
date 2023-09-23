#!/bin/bash

#Harvest onions from various sources
#1 18 * * * /home/scraper/torscraper/scripts/harvest.sh

# get ssh fingerprints for new sites
#1 4,16 * * * /home/scraper/torscraper/scripts/update_fingerprints.sh

# mark sites as genuine / fake from the /r/darknetmarkets superlist    
#1 9 * * 1 /home/scraper/torscraper/scripts/get_valid.sh

# scrape pastebin for onions (needs paid account / IP whitelisting)                 
#*/5 * * * * /home/scraper/torscraper/scripts/pastebin.sh

# portscan new onions               
#1 */6 * * * /home/scraper/torscraper/scripts/portscan_up.sh

# scrape stronghold paste
#32 */2 * * * /home/scraper/torscraper/scripts/stronghold_paste_rip.sh

# detect clones
#16 3 * * * /home/scraper/torscraper/scripts/detect_clones.sh


/opt/torscraper/scripts/update_fingerprints.sh
/opt/torscraper/scripts/get_valid.sh
/opt/torscraper/scripts/pastebin.sh
/opt/torscraper/scripts/portscan_up.sh
/opt/torscraper/scripts/stronghold_paste_rip.sh
/opt/torscraper/scripts/detect_clones.sh

service haproxy restart
echo "harvest.sh"
/opt/torscraper/scripts/harvest.sh
echo "push_list.sh"
split --lines 50 /opt/torscraper/onions_list/onions.txt /opt/torscraper/onions_list/onions_
rm /opt/torscraper/onions_list/onions.txt
for file in `ls -1 /opt/torscraper/onions_list/onions_*`
do 
/opt/torscraper/scripts/push_list.sh $file
rm $file
done
echo "scrape.sh"
/opt/torscraper/scripts/scrape.sh
echo "scrape.sh"
/opt/torscraper/scripts/scrape.sh
