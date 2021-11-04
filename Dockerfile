FROM debian:11-slim

# install prerequisites
RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install --yes --no-install-recommends netbase nfs-common dbus nfs-ganesha nfs-ganesha-vfs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && mkdir -p /run/rpcbind /export /var/run/dbus \
    && touch /run/rpcbind/rpcbind.xdr /run/rpcbind/portmap.xdr \
    && chmod 755 /run/rpcbind/* \
    && chown messagebus:messagebus /var/run/dbus

# NFS ports and portmapper
EXPOSE 2049 38465-38467 662 111/udp 111

# /export is commonly exported
VOLUME /export

# Add startup script
COPY start.sh /

# Start Ganesha NFS daemon by default
CMD ["/start.sh"]

