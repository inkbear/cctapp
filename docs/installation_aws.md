# Installation on AWS

Once it is all working on local host the application can be put onto AWS EC2

## AWS Platform Configuration

Build the ec2 instances and install LAMP stack as per Amazon instructions. Use the LAMP Stack template if available.

Make sure PHP is version 7+ and has the right modules.

    sudo yum install php72-mbstring
    sudo yum install php72-mysqli

## Modify Apache Conf

Set the doc root to the public folder and update to allow reading the .htaccess file for redirection.

Change Allow Override to All 

    AllowOverride All

While we are here, add aliases to a new conf file (/etc/httpd/conf.d/aliases.conf) for other web sites on the same URL.

    Alias "/mapper" "/var/www/html/mapper"
    Alias "/db" "/var/www/html/phpmyadmin"

Restart Apache to pickup the changes

    sudo service httpd restart

## Install Composer

Install composer as per Amazon instructions.

    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('sha384', 'composer-setup.php') === '572cb359b56ad9ae52f9c23d29d4b19a040af10d6635642e646a7caa7b96de717ce683bd797a92ce99e5929cc51e7d5f') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"

If less than 2GB memory are ont he AWS instance configure a swap file for 2GB.

    sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=2048
    sudo /sbin/mkswap /var/swap.1
    sudo chmod 600 /var/swap.1
    sudo /sbin/swapon /var/swap.1

## Install Laravel Framework

Use Composer to intall Laravel framework. You will also need to generate a key for sessions which writes to the .env file and modify ownership so Apache can write files.

    composer create-project laravel/laravel cctapp "7.*" --prefer-dist
    php artisan key:generate
    sudo chown -R apache storage
    sudo chown -R apache hooks

Load the root URL and see if Laravel is displayed.

## Add Voyager Admin and Front End

Use composer to install and configure the modules.

    composer require tcg/voyager
    composer require pvtl/voyager-frontend
    composer install 

## Create and Load the Database

Create database cctapp as UTF8 MB4 ci and import the data. Using PHPMyAdmin is recommended.

## Configure the Environment File

Update .env for appname and db credentials. The site should start forming but may be wonky until the files are uploaded.

## Upload Files

Upload the app files and anything modified. This will use Git Hub later.

Test out the site.

