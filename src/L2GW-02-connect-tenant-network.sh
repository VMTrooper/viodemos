echo "neutron-l2gw l2-gateway-connection-create L2GW 1a6bf518-92db-487f-b0a6-d115878f10a0 --default-segmentation-id 964"

sleep 3 
echo "Created a new l2_gateway_connection:
+-----------------+--------------------------------------+
| Field           | Value                                |
+-----------------+--------------------------------------+
| id              | 325536ae-03b0-4dec-9716-80a24f659755 |
| l2_gateway_id   | 369dbf17-2812-4864-b024-994c4e238346 |
| network_id      | 1a6bf518-92db-487f-b0a6-d115878f10a0 |
| segmentation_id | 964                                  |
| tenant_id       | 1b4f295dda9044b6ab7f2c0b0760ce87     |
+-----------------+--------------------------------------+"
