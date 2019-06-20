# Cloudflare bash tool

## Features
### Support .env (ini config)
You could use different .env file to manage multi domains
```
ENV=.env-lan ./update-dns.sh
ENV=.env-wan ./update-dns.sh
```
* Sample [.env](.env.sample)

### Support debug mode
* DEBUG=1 ./update-dns.sh

### Support wan and lan ip
* IP_TYPE=lan ./update-dns.sh 
* IP_TYPE=wan ./update-dns.sh 

## Use Crontab autoupdate
* sudo crontab -e
```
*/5 * * * * /home/sys/bin/ddns.sh > /dev/shm/ddns.log 
```

## Inspire
* https://gist.github.com/benkulbertis/fff10759c2391b6618dd
