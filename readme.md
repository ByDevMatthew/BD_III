user: CodeUserSpace
password: word-car-ball-chest-pineapple-bubble

sudo apt update
sudo apt install mariadb-server mariadb-client -y
sudo service mariadb start
sudo mysql-secure-installation

sudo mysql -u root -p