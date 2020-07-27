# Foundry VTT Docker Container

---

* [Report any bugs, issues or feature requests on GitHub](https://github.com/cmbernard333/foundryvtt/issues)

---

## Usage

This container exposes four volumes:
* `/home/foundryvtt/foundrydata` - Foundry VTT data directory


This container exposes two ports:
* `3000/tcp` nodeJS server port

---

---

**The most basic way to run this container:**

```bash
$ docker run --name foundryvtt -d \
    -p 30000:30000/tcp \
    beardfish/foundryvtt
```

---

---

## TODO (in no particular order)
[ ] Expose Foundry VTT certs directory
[ ] Better runtime support for Foundry VTT temporary URLs
[ ] Publish official image to docker hub
[ ] Support all [Application Configuration Options](https://foundryvtt.com/article/configuration/)