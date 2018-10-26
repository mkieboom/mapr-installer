# mapr-installer

##### Clone the project
```
git clone https://github.com/mkieboom/mapr-installer  
cd mapr-installer  
```

#### Build the MapR Installer container
```
docker build -t mkieboom/mapr-installer .
```

#### Run the MapR Installer container
```
docker run -it \
  -p 9443:9443 \
  mkieboom/mapr-installer
```

#### Run the MapR Installer container
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