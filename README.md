# Common Message Layer (CML)

### Generate code from protobufs

`docker build -t cml:latest .`

`docker run -v $PWD:/usr/local/cml -it cml:latest /bin/sh -c 'cd /usr/local/cml && ./generate.sh'`

### Message Structure

| Token HI | Token LO | Addr HI | Addr LO | Length HI | Length LO | CRC HI | CRC LO | CML Payload |
| -------- | -------- | ------- | ------- | --------- | --------- | ------ | ------ | ----------- |

| CML Payload            |                                                     |
| ---------------------- | --------------------------------------------------- |
| Type                   | UNSPECIFIED, INFORM, GET, SET                       |
| Acknowledge            | OUT, RETRY, IN, NACK                                |
| Timestamp              | unsigned 64-bit integer, unix epoch in milliseconds |
| Time-to-live (TTL)     | unsigned 64-bit integer, time in milliseconds       |
| CML Inner Payload Type | Raw, Client, Device, Status                         |
| CML Inner Payload      | bytes, see below                                    |

| CML Inner Payloads |                                                                                                           |
| ------------------ | --------------------------------------------------------------------------------------------------------- |
| Raw                | raw bytes or unspecified                                                                                  |
| Device             | Config, status, generic digital, generic analog, accelerometer, gyroscrope, magnetometer, motor, location |
| Client             | Config, status                                                                                            |
