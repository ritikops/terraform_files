sudo apt-get install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx


echo "<h1>welcome this script is running successfully!</h1>" | sudo tee /var/www/html/index.html