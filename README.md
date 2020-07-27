# Foundry VTT Docker Container

---

* [Report any bugs, issues or feature requests on GitHub](https://github.com/cmbernard333/foundryvtt/issues)

---

## Customizing the image

The container supports the following arguments;

* `FOUNDRYVTT_USER` - the user that runs the hosting node process - default `foundryvtt`
* `FOUNDRYVTT_GROUP` - the group the user is in - default `foundryvtt`
* `FOUNDRYVTT_HOME` - the home directory the foundryvtt install - default `/home/foundryvtt`

By default you do not need to specify any of these arguments while building.

---

## Usage

This container exposes the following volume(s):
* `$FOUNDRYVTT_HOME/foundrydata` - Foundry VTT data directory - default `/home/foundryvtt/foundrydata`


This container exposes the following port(s):
* `30000/tcp` nodeJS server port

---

**The most basic way to run this container:**

```bash
$ docker run --name foundryvtt -d \
    - e FOUNDRYVTT_URL="<foundry-vtt-download-url>"
    -p 30000:30000/tcp \
    beardfish/foundryvtt
```

---

## TODO (in no particular order)
- [ ] Expose Foundry VTT certs directory
- [ ] Better runtime support for Foundry VTT temporary URLs
- [ ] Publish official image to docker hub
- [ ] Support all [Application Configuration Options](https://foundryvtt.com/article/configuration/)