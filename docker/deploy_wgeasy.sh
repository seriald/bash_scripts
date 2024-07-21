sudo docker run -d \
  --name=wg-easy \
  -e LANG=de \
  -e WG_HOST=10.0.1.3 \
  -e PASSWORD=Mason123$ \
  -e PORT=51821 \
  -e WG_PORT=51820 \
  -v ~/.wg-easy:/etc/wireguard \
  -p 51820:51820/udp \
  -p 51821:51821/tcp \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --sysctl="net.ipv4.ip_forward=1" \
  --restart unless-stopped \
weejewel/wg-easy



sudo docker run -d \
  --name=wg-easy \
  -e LANG=de \
  -e WG_HOST=10.0.1.5 \
  -e PASSWORD=Mason123$ \
  -e PORT=51821 \
  -e WG_PORT=51820 \
  -p 51820:51820/udp \
  -p 51821:51821/tcp \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --sysctl="net.ipv4.ip_forward=1" \
  --restart unless-stopped \
weejewel/wg-easy