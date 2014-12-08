#
# Stop services
service apache2 stop
service mysql stop
#
apt-get update
#
apt-get -q -y remove apache2
apt-get -q -y install apache2
#
apt-get -q -y remove mysql-server mysql-client
echo mysql-server mysql-server/root_password password password | debconf-set-selections
echo mysql-server mysql-server/root_password_again password password | debconf-set-selections
apt-get -q -y install mysql-server mysql-client
#