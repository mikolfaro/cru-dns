CRU-DNS
=======
DNS server controllable via REST APIs.
The tool is composed by two server:
- a REST API webservice [cru-dns-api](https://github.com/mikolfaro/cru-dns-api)
- a DNS server [cru-dns-replica](https://github.com/mikolfaro/cru-dns-replica)

`API` webservice allows to control registered records and replicas.
`Replicas` are instances of the DNS server that are expected to have the
records configured.
`API` and `Replicas` synchronization uses websockets.

It is a good practice to have more then one domain server, this way you will be
able to create as many as needed. (My plan is about 4).

API
---
API is a Rails server, with REST API and HTML panel

Replica
-------
Replica is based on celluloid, both for DNS server implementation and websocket
client.

Caveats
-------
At the moment the API is a single point-of-failure


Why CRU-DNS?
------------
Because a registrar I currently use for my job has an ugly UI.
In it I cannot understand if a DKIM record is written correctly or not.
