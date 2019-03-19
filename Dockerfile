# MapR Installer - Customization
#
# VERSION 0.1 - for demo purposes only

# Inherit the MapR Installer Docker image
FROM maprtech/installer

# Change minimum RAM and disk requirements to allow for installation on limited environments
RUN sed -i -e "s/MIN_RAM: 16/MIN_RAM: 1/" /opt/mapr/installer/ansible/playbooks/group_vars/all
RUN sed -i -e "s/min_size: 30/min_size: 1/" /opt/mapr/installer/ansible/playbooks/group_vars/all

# Add a yaml file for low memory configuration
ADD yaml/low_memory.yml /opt/mapr/installer/ansible/playbooks/low_memory.yml

# Run low_memory.yml after disksetup.yaml
RUN sed -i -e "s/- import_playbook: disksetup.yml/- import_playbook: disksetup.yml\\n- import_playbook: low_memory.yml/" /opt/mapr/installer/ansible/playbooks/mapr_top.yml

# Run low_memory.yml after ecosystem_install.yml
RUN sed -i -e "s/- import_playbook: ecosystem_install.yml/- import_playbook: ecosystem_install.yml\\n- import_playbook: low_memory.yml/" /opt/mapr/installer/ansible/playbooks/mapr_top.yml

# Disable installation of MapR Monitoring / Metrics / Metering
RUN sed -i -e "s/    def import_template(self, add_metrics=False):/    def import_template(self, add_metrics=False):\\n        add_metrics=False/" /opt/mapr/installer/lib/managers.py

# Add MapR Setup sample scripts
ADD scripts/install_base.sh /install_base.sh
RUN chmod +x /*.sh
