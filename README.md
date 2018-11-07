# mapr-installer

## Run the customized MapR Installer container from docker hub
Download and run the customized MapR Installer container from docker hub:
```
docker run -it \
  -p 9443:9443 \
  mkieboom/mapr-installer
```

### Alternatively: Manually build the MapR Installer container
Alternatively, clone the github project and build the container manually, eg:
```
# Clone the container project
git clone https://github.com/mkieboom/mapr-installer  
cd mapr-installer  

# Build the customized MapR Installer container
docker build -t mkieboom/mapr-installer .

# Use the docker run command to launch the container
```

## Run the MapR Installer container
Launch the MapR installation from inside the container, for example:
```
/opt/mapr/installer/bin/mapr-installer-cli install -nvf \
-o environment.mapr_core_version=6.1.0 \
-o config.mep_version=6.0.0 \
-o config.cluster_name=demo.mapr.com \
-o config.cluster_admin_id=mapr \
-o config.cluster_admin_password=mapr \
-o config.hosts='["192.168.1.11"]' \
-o config.disks='["/dev/sdb"]' \
-o config.security=True \
-o config.enable_encryption_at_rest=True \
-o config.enable_nfs=True \
-o config.nfs_type="NFSv3" \
-o config.ssh_id=root \
-o config.ssh_password=mapr
```

Adds MapR Eco-System packages, for example Drill or Spark on YARN:
```
# Add Drill to the installation:
-o config.services.mapr-drill.enabled=True
```

```
# Add Spark on Yarn to the installation:
-o config.services.mapr-spark-2.3.1.enabled=True \
-o config.services.mapr-spark-historyserver.enabled=True \
-o config.services.mapr-nodemanager.enabled=True \
-o config.services.mapr-resourcemanager.enabled=True
```

Use a ssh private key file instead of a ssh password:
```
# replace config.ssh_password with:
-o config.ssh_key_file="/tmp/key"
```

## Reset the MapR Installer container database
```
/opt/mapr/installer/bin/mapr-installer-cli reset -nvf
```

## Probe an existing cluster
```
/opt/mapr/installer/bin/mapr-installer-cli probe -n \
-o config.ssh_id=root \
-o config.ssh_password=mapr \
-o config.hosts='["192.168.1.11"]' \
 > /tmp/myprobedcluster.yaml
```