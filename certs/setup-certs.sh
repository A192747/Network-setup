#!/bin/sh

set -e

DOMAIN="router.lan"
ROUTER_IP="192.168.3.1"

BASE_DIR="$(pwd)"
CERT_DIR="$BASE_DIR/certs"

echo "======================================="
echo " HomeLab TLS + Nginx Proxy Manager Setup"
echo "======================================="

echo ""
echo "Creating directories..."

mkdir -p "$CERT_DIR"
mkdir -p "$BASE_DIR/data"
mkdir -p "$BASE_DIR/letsencrypt"

cd "$CERT_DIR"

echo ""
echo "Generating Local CA..."

openssl genrsa -out localCA.key 4096

openssl req -x509 -new -nodes \
-key localCA.key \
-sha256 \
-days 3650 \
-out localCA.crt \
-subj "/CN=Router LAN CA"

echo ""
echo "Generating wildcard certificate for *.$DOMAIN"

openssl genrsa -out ${DOMAIN}.key 4096

openssl req -new \
-key ${DOMAIN}.key \
-out ${DOMAIN}.csr \
-subj "/CN=*.$DOMAIN"

cat > ${DOMAIN}.ext <<EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, keyEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = *.$DOMAIN
DNS.2 = $DOMAIN
EOF

openssl x509 -req \
-in ${DOMAIN}.csr \
-CA localCA.crt \
-CAkey localCA.key \
-CAcreateserial \
-out ${DOMAIN}.crt \
-days 3650 \
-sha256 \
-extfile ${DOMAIN}.ext

echo ""
echo "Certificates generated:"
ls -1

echo ""
echo "---------------------------------------"
echo "Configuring LuCI ports..."
echo "---------------------------------------"

UHTTPD_CONFIG="/etc/config/uhttpd"

if [ -f "$UHTTPD_CONFIG" ]; then

    sed -i "s/0.0.0.0:80/0.0.0.0:88/g" $UHTTPD_CONFIG

    sed -i "s/0.0.0.0:443/0.0.0.0:444/g" $UHTTPD_CONFIG

    echo "Restarting uhttpd..."

    /etc/init.d/uhttpd restart

    echo ""
    echo "LuCI moved to:"
    echo "http://$ROUTER_IP:88"
else

    echo "WARNING: /etc/config/uhttpd not found"
fi

echo ""
echo "---------------------------------------"
echo "Configuring dnsmasq wildcard domain..."
echo "---------------------------------------"

DNSMASQ_CONF="/etc/dnsmasq.conf"

if ! grep -q ".$DOMAIN" "$DNSMASQ_CONF"; then

    echo "address=/.$DOMAIN/$ROUTER_IP" >> "$DNSMASQ_CONF"

    echo "Restarting dnsmasq..."

    /etc/init.d/dnsmasq restart
fi

echo ""
echo "---------------------------------------"
echo "Setup complete"
echo "---------------------------------------"

echo ""
echo "LuCI:"
echo "http://$ROUTER_IP:88"

echo ""
echo "Nginx Proxy Manager panel:"
echo "http://$ROUTER_IP:81"

echo ""
echo "Example services:"
echo "https://grafana.$DOMAIN"
echo "https://nas.$DOMAIN"

echo ""
echo "IMPORTANT:"
echo "Install certs/localCA.crt into your system trust store"