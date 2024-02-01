### Download and unpack this repo on your device.

```
rm -r /data/persist_custom_settings_venusos-master
wget https://github.com/mcfrojd/persist_custom_settings_venusos/archive/refs/heads/master.zip
unzip master.zip "persist_custom_settings_venusos-master/*" -d /data
rm master.zip
cd /data/persist_custom_settings_venusos-master
chmod a+x setup.sh
clear
ls -al
```

### Things to check / improve

1. on next firmware update, check if the file authorized_keys is still there or if this needs to be added to this script
2. on next firmware update, verify that this script works.