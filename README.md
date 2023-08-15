# Common Message Layer (CML)

### Message Structure

| Token HI | Token LO | Addr HI | Addr LO | Length HI | Length LO | CRC HI | CRC LO | CML Payload |
| -------- | -------- | ------- | ------- | --------- | --------- | ------ | ------ | ----------- |

| CML Payload            |                                                     |
| ---------------------- | --------------------------------------------------- |
| Type                   | UNSPECIFIED, INFORM, GET, SET                       |
| Acknowledge            | OUT, RETRY, IN, NACK                                |
| Timestamp              | unsigned 32-bit integer, unix epoch in milliseconds |
| Time-to-live (TTL)     | unsigned 32-bit integer, time in milliseconds       |
| CML Inner Payload Type | Raw, Client, Device, Status                         |
| CML Inner Payload      | bytes, see below                                    |

| CML Inner Payloads |                                                                                           |
| ------------------ | ----------------------------------------------------------------------------------------- |
| Device             | Generic digital, generic analog, accelerometer, gyroscrope, magnetometer, motor, location |
| Client             | Config, Power/Battery, IP                                                                 |
| Common             | Confg, Status                                                                             |
