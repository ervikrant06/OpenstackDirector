# NOTE:
#
# if CEPH node count is 2 then make sure you set "ceph::profile::params::osd_pool_default_size: 2" in /usr/share/openstack-tripleo-heat-templates/puppet/services/ceph-mon.yaml
#[stack@ibm-x3630m4-5 ~]$ egrep -ir ceph::profile::params::osd_pool_default_size /usr/share/openstack-tripleo-heat-templates/puppet/services/ceph-mon.yaml
#            ceph::profile::params::osd_pool_default_size: 2

$ openstack overcloud deploy --templates -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml -e /home/stack/templates/network-environment.yaml -e /home/stack/templates/storage-environment.yaml  -e /home/stack/templates/neutron-sriov.yaml  --neutron-bridge-mappings sriov:br-siov,datacentre:br-ex  --neutron-network-vlan-ranges sriov:171:172  --control-flavor control --control-scale 3 --compute-scale 1 --compute-flavor compute  --ceph-storage-scale 2     --ntp-server  clock.corp.redhat.com 
