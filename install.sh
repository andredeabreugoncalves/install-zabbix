
apt update && upgrade -y
apt net-tools wget tcpdump -y

echo "==================instalando docker=================="

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
rm get-docker.sh

echo "==================Instalando DOCKER-COMPOSE=================="

apt-get install -y docker-compose 

echo "==================Certificado SSL ssp.sc.gov.br=================="

mkdir -p /etc/httpd/ssl/private
chmod 700 /etc/httpd/ssl
cp /root/install-lnsspsc-zabbix01/ssl/ssl.crt /etc/httpd/ssl/
cp /root/install-lnsspsc-zabbix01/ssl/ssl.key /etc/httpd/ssl/private

echo "==================deploy Docker-Compose=================="

docker-compose -p zabbix up -d

