echo "openstack image list"
openstack image list

read -n1 -r key

echo '
openstack image create --property vmware_disktype="sparse" \
--property vmware_adaptertype="ide" \
--container-format bare --disk-format vmdk \
--file cirros-0.3.3.vmdk \
cirros-0.3.3
'

openstack image create --property vmware_disktype="sparse" \
--property vmware_adaptertype="ide" \
--container-format bare --disk-format vmdk \
--file cirros-0.3.3.vmdk \
cirros-0.3.3

# For progress indicator, use python-glanceclient until python-openstackclient includes it
# glance image-create --property vmware_disktype="sparse" \
# --property vmware_adaptertype="ide" \
# --name cirros-0.3.3 --container-format bare --disk-format vmdk \
# --progress < /tmp/cirros-0.3.3.vmdk

# #OR

# glance image-create --property vmware_disktype="sparse" \
# --property vmware_adaptertype="ide" \
# --name cirros-0.3.3 --container-format bare --disk-format vmdk \
# --progress --file /tmp/cirros-0.3.3.vmdk

#http://download.cirros-cloud.net/0.3.4/cirros-0.3.4-x86_64-disk.img

