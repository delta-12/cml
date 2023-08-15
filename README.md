# Common Message Layer (CML)

### Message Structure

| Token HI | Token LO | Addr HI | Addr LO | Length HI | Length LO | CRC HI | CRC LO | CML Payload |
| -------- | -------- | ------- | ------- | --------- | --------- | ------ | ------ | ----------- |

| CML Payload        |                                                     |
| ------------------ | --------------------------------------------------- |
| Action             | UNSPECIFIED, INFORM, GET, SET                       |
| Acknowledge        | OUT, RETRY, IN, NACK                                |
| Timestamp          | unsigned 32-bit integer, unix epoch in milliseconds |
| Time-to-live (TTL) | unsigned 32-bit integer, time in milliseconds       |
| CML Sub-Payload    |

| CML Sub-Payloads |                                                                                           |
| ---------------- | ----------------------------------------------------------------------------------------- |
| Device           | Generic digital, generic analog, accelerometer, gyroscrope, magnetometer, motor, location |
| Client           | Config, Power/Battery, IP                                                                 |
| Common           | Status                                                                                    |
