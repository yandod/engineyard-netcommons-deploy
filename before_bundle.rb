# html/webapp/config/install.inc.php
if File.exist?(current_path + "/html/webapp/config/install.inc.php") then
  #config
  run "cp #{current_path}/html/webapp/config/install.inc.php #{shared_path}/config/install.inc.php"
  # images js themes
  run "cp -R #{current_path}/html/htdocs/images #{shared_path}/htdocs/images"
  run "cp -R #{current_path}/html/htdocs/js #{shared_path}/htdocs/js"
  run "cp -R #{current_path}/html/htdocs/themes #{shared_path}/htdocs/themes"
end

if File.exist?(shared_path + "/config/install.inc.php") then
  run "rm #{release_path}/html/webapp/config/install.inc.php"
  run "ln -s #{shared_path}/config/install.inc.php #{release_path}/html/webapp/config/install.inc.php"
  # images js themes
  run "ln -s #{shared_path}/htdocs/images #{release_path}/html/htdocs/images"
  run "ln -s #{shared_path}/htdocs/js #{release_path}/html/htdocs/js"
  run "ln -s #{shared_path}/htdocs/themes #{release_path}/html/htdocs/themes"
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