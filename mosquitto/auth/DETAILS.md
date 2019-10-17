## mosquitto configuration
```conf
##########################################
#ssl CA and keys
cafile /etc/mosquitto/certs/ca.crt
certfile /etc/mosquitto/certs/server.crt
keyfile /etc/mosquitto/certs/server.key

persistence true
persistence_location /etc/mosquitto/data/

log_dest file /etc/mosquitto/log/mosquitto.log
connection_messages true
log_timestamp true
log_type all

allow_anonymous false
#password_file /etc/mosquitto/passwd

##########################################
#bridge configuration
connection mosquitto_bridge
addresses ${MQTT_BRIDGE_MASTER}:${HOST_PORT_MQTT_BRIDGE} ${MQTT_BRIDGE_SLAVE}:${HOST_PORT_MQTT_BRIDGE}
topic # both 2 "" ""

try_private true
round_robin false
cleansession true
start_type automatic

#remote_clientid remote.master.client
#local_clientid local.client

#sys_admin is a super user with all acls
local_username sys_admin
local_password passw0rd@
notifications true

##########################################
#auth plugin for mysql configuration
#
#
#   __  __       ____   ___  _
#  |  \/  |_   _/ ___| / _ \| |
#  | |\/| | | | \___ \| | | | |
#  | |  | | |_| |___) | |_| | |___
#  |_|  |_|\__, |____/ \__\_\_____|
#          |___/
#
#
auth_plugin /usr/lib/auth-plug.so
#auth_opt_acl_cacheseconds default is 300 seconds
auth_opt_acl_cacheseconds 0
auth_opt_auth_cacheseconds 0
auth_opt_backends mysql
auth_opt_host ${DATABASE_SERVER_HOSTNAME}
auth_opt_port ${DATABASE_SERVER_PORT_SLAVE}
auth_opt_dbname ${DATABASE_NAME}
auth_opt_user ${DATABASE_SERVER_USERNAME}
auth_opt_pass ${DATABASE_SERVER_PASSWORD}
auth_opt_userquery SELECT pw FROM mqtt_users WHERE username = '%s'
auth_opt_superquery SELECT IFNULL(COUNT(*), 0) FROM mqtt_users WHERE username = '%s' AND super = 1
auth_opt_aclquery SELECT topic FROM mqtt_acls WHERE username = '%s'
```
## mosquitto bridge configuration
```conf
log_dest file /etc/mosquitto/log/mosquitto_bridge.log
connection_messages true
log_timestamp true
log_type all
```
