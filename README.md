Small persisted script to update various setting that might get lost when installing latest venus os.

### Download and unpack this repo on your device.

```
rm -r /data/persist_custom_settings_venusos-master
wget https://github.com/mcfrojd/persist_custom_settings_venusos/archive/refs/heads/master.zip
unzip master.zip "persist_custom_settings_venusos-master/*" -d /data
rm master.zip
cd /data/persist_custom_settings_venusos-master
chmod a+x setup.sh
./setup.sh
```

### What will this script do?

1. Change the hostname. (If you dont edit the files the hostname will be set to "doris-venusos")
   1. You need to edit the files "hostname" & "hosts" to your liking
   2. You need to change the variable "HOSTNAME" in setup.sh to your linking
2. Add your favorite ALIASES
   1. You need to change / add your aliases in setup.sh

### Things to check / improve

1. on next firmware update, verify that this script works.