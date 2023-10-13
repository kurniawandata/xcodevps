#!/bin/bash
#Source code ini dibuat oleh Kurniawan - https://xcodehoster.com. Source code ini hanya gambaran cara kerja bagaimana VPS bisa dibuat secara otomatis melalui website
echo "Content-type: text/html"
echo ""
name=`echo "$QUERY_STRING" | awk '{split($0,array,"&")} END{print array[1]}' | awk '{split($0,array,"=")} END{print array[2]}' | tr [:upper:] [:lower:]`
password=`echo "$QUERY_STRING" | awk '{split($0,array,"&")} END{print array[2]}' | awk '{split($0,array,"=")} END{print array[2]}'`
email=`echo "$QUERY_STRING" | awk '{split($0,array,"&")} END{print array[3]}' | awk '{split($0,array,"=")} END{print array[2]}'`
wa=`echo "$QUERY_STRING" | awk '{split($0,array,"&")} END{print array[4]}' | awk '{split($0,array,"=")} END{print array[2]}'`
cek=`echo "$QUERY_STRING" | awk '{split($0,array,"&")} END{print array[5]}' | awk '{split($0,array,"=")} END{print array[2]}'`
line=$(head -n 1 acak.txt)
port=$(head -n 1 portserver.txt)
portweb=$(head -n 1 portwebsite)
tanggal=$(date +%d-%m-%Y)
random=$(tr -dc a-z0-9 </dev/urandom | head -c 13 ; echo '')
function urldecode() { : "${*//+/ }"; echo -e "${_//%/\x}"; }
email=$(printf '%b' "${email//%/\\x}")
if [[ "${name}" =~ [^a-z0-9] ]]; then
echo "Username hanya boleh huruf kecil dan angka"
else
if [[ "${password}" =~ [^a-z0-9] ]]; then
echo "Password hanya boleh huruf kecil dan angka"
else
if [[ "${email}" =~ [^a-z0-9.@] ]]; then
echo "Hanya mendukung format e-mail"
else
if [[ $email =~ "@peykesabz.com" ]]; then
echo "Registrasi hanya mendukung peykesabz.com"
else
if [ -n "$(ls /home/data/$email | xargs -n 1 basename)" ]; then
echo "E-mail ini sudah digunakan, silahkan gunakan e-mail yang lain"
else
if [[ "$cek" != "$line" ]]; then 
echo "Kode aktivasi ini sudah digunakan user lain, setiap ada yang daftar maka kode aktivasi berubah, sehingga saat dapat kode aktivasi secepatnya diaktifkan."
else
echo "username $name password $password. Salam dari kami xcodehoster" | mail -s "Informasi username dan password akun xcodehoster" $email
echo $email > /home/data/$email
echo $name, $password, $email, $wa, $tanggal, $port. > /home/data2/$email
acak=$(tr -dc 2-5 </dev/urandom | head -c 10 ; echo '')
echo $acak > acak201.txt
if [[ "${wa}" =~ [^a-z0-9] ]]; then
echo "Nomor WA hanya boleh angka"
else
if [ -z "$(ls -A /home/$name)" ]; then
sudo mkdir /home/$name
sudo touch /home/$name/locked
echo $name, $password, $email, $wa, $tanggal $port. > /home/rambutan/$name.$tanggal
echo $name, $password, $email, $wa, $tanggal $port. > /home/recovery/$name.$random
sudo mcrypt /home/recovery/$name.$random -k $wa
cp /home/xcodehoster/subdomain.conf /etc/apache2/sites-available/$name.conf
sed -i "s/sample/$name/g" /etc/apache2/sites-available/$name.conf
sed -i "s/nomor/$portweb/g" /etc/apache2/sites-available/$name.conf
sudo a2ensite $name.conf
sudo systemctl reload apache2
sudo cp /usr/lib/cgi-bin/aktivasi3.sh /usr/lib/cgi-bin/aktivasdatai4.sh
sed -i "s/unik/$name/g" /usr/lib/cgi-bin/aktivasdatai4.sh
chmod 777 aktivasdatai4.sh
./aktivasdatai4.sh
rm aktivasdatai4.sh
cp /usr/lib/cgi-bin/running1.php  /usr/lib/cgi-bin/runningserver.php
sed -i "s/unikport/$port/g" /usr/lib/cgi-bin/runningserver.php
sed -i "s/numberdata/$portweb/g" /usr/lib/cgi-bin/runningserver.php
sed -i "s/unikuser/$name/g" /usr/lib/cgi-bin/runningserver.php
sed -i "s/unikpass/$password/g" /usr/lib/cgi-bin/runningserver.php
mkdir /home/$name
sudo chmod 777 /home/$name
sudo php runningserver.php
cp /usr/lib/cgi-bin/running2.php /usr/lib/cgi-bin/list/running$port.php
a=1
port=$((port+a))
echo $port > portserver.txt
cp portserver.txt /var/www/html
port2=$(head -n 1 portserver.txt)
b=1
port2=$((port-b))
x=1
portweb=$((portweb+x))
echo $portweb > portwebsite
cp portwebsite /var/www/html
portweb2=$(head -n 1 portwebsite)
y=1
portweb2=$((portweb-y))
cat <<EOT
<!DOCTYPE html>
<html>
<head>
<title>Xcodehoster</title>
</head>
<body>
<h2>Welcome $name </h1>
<br />
Alamat website anda</br>
Subdomain anda : https://$name.namasituskamu.com<br />
<br />
Akses SSH anda:<br />
Host : subdomain.namasituskamu.com<br />
Port : $port2<br />
Username : root <br />
Password : $password<br />
<br />
<br/>
<br>
</body>
</html>
EOT
else
echo "Subdomain yang anda masukkan sudah ada pemiliknya"
fi
fi
fi
fi
fi
fi
fi
fi
