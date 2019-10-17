# mosquitto-auth
Docker image: [mosquitto-auth](https://hub.docker.com/r/bluecatr/mosquitto-auth)

mosquitto with auth plugins

## docker compose sample
```yaml
version: '3'
services:
  mosquitto-bridge:
    image: bluecatr/mosquitto-auth
    restart: always
    ports:
      - $HOST_PORT_MQTT_BRIDGE:1883
    volumes:
      - ./config:/etc/mosquitto
    command: ["-c", "/etc/mosquitto/mosquitto_bridge.conf"]

  mosquitto:
    image: bluecatr/mosquitto-auth
    restart: always
    depends_on:
      - mosquitto-bridge
    ports:
      - $HOST_PORT_MQTT:1883
    volumes:
      - ./config:/etc/mosquitto
    command: ["-c", "/etc/mosquitto/mosquitto.conf"]
```
