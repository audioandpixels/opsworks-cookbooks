# Install package dependencies for wav2png
apt_package "libpng++-dev" do
	action :install
end

apt_package "libboost-program-options-dev" do
	action :install
end

# Move wav2png after rails app deploy
bash "Move wav2png to PATH bin location" do
  code <<-EOL 
  cp /mnt/srv/www/audiometric_app/current/vendor/wav2png/bin/wav2png /usr/bin/wav2png
  chmod 755 /usr/bin/wav2png
  chown root:root /usr/bin/wav2png
  EOL
end