# html/webapp/config/install.inc.php
if !File.exist?(current_path + "/html/webapp/config/install.inc.php") then
  run "cp #{current_path}/html/webapp/config/install.inc.php #{shared_path}/config/install.inc.php"
end

if File.exist?(shared_path + "/config/install.inc.php") then
  run "ln -s #{shared_path}/config/install.inc.php #{release_path}/html/webapp/config/install.inc.php"
end

# html/webapp/templates_c
run "mkdir #{release_path}/html/webapp/templates_c"


# html/webapp/uploads
if !Dir.exist?(shared_path + "/html/webapp/uploads") then
  run "mkdir -p #{shared_path}/html/webapp/uploads"
end
run "ln -s #{shared_path}/html/webapp/uploads #{release_path}/html/webapp/uploads"

# date.timezone = Asia/Tokyo
sudo "echo 'date.timezone = Asia/Tokyo' > /etc/php/cgi-php5.4/ext-active/timezone.ini"
sudo "echo 'date.timezone = Asia/Tokyo' > /etc/php/cli-php5.4/ext-active/timezone.ini"
sudo "echo 'date.timezone = Asia/Tokyo' > /etc/php/fpm-php5.4/ext-active/timezone.ini"