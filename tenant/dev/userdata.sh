#!/bin/bash
# Apache2 Kurulumu için User Data
#small delay 
sleep 10
# Paket listelerini güncelle
apt-get update -y

# Apache2 paketini kur
apt-get install apache2 -y

# Apache2 servisini başlat
systemctl start apache2

# Apache2 servisini sistem başlangıcında otomatik başlatmak için enable et
systemctl enable apache2

# Varsayılan web sayfasını değiştirelim (Opsiyonel)
echo "<h1>Apache Server is successfully installed on $(hostname)</h1>" > /var/www/html/index.html