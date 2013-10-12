# Move wav2png after rails app deploy
bash "Move wav2png to PATH bin location" do
  code "sudo cp /mnt/srv/www/audiometric_app/current/vendor/wav2png/bin/wav2png /usr/bin/wav2png"
  code "sudo chmod 755 /usr/bin/wav2png"
  code "sudo chown root:root /usr/bin/wav2png"
end