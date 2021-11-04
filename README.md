# docker-ganesha
Ganesha NFS Docker image

## Configuration
| Environment | Default | Description |
| - | - | - |
| `LOG_FILE` | `/dev/stdout` | Where to write the Ganesha log message |
| `LOG_LEVEL` | `NIV_EVENT` | Log level (set to `NIV_DEBUG` for debugging) |
| `RPC_STATD_PORT` | 662 | Port for `rcp.statd` to listen on |
