source "arm-image" "raspios-buster" {
  iso_url      = "https://downloads.raspberrypi.org/raspios_armhf/images/raspios_armhf-2021-05-28/2021-05-07-raspios-buster-armhf.zip"
  iso_checksum = "sha256:b6c04b34d231f522278fc822d913fed3828d0849e1e7d786db72f52c28036c62"
}

build {
  sources = ["source.arm-image.raspios-buster"]

  provisioner "shell" {
    inline = ["touch /boot/ssh"]
  }

  provisioner "shell" {
    inline = ["df -h"]
  }

  provisioner "shell" {
    inline = ["wget https://raw.githubusercontent.com/DEANpeterV/elimupi2.0/master/ElimuPi_installer.py"]
  }

  provisioner "shell" {
    inline = ["python3 ElimuPi_installer.py"]
  }

  post-processor "shell-local" {
    inline = ["wget https://raw.githubusercontent.com/Drewsif/PiShrink/master/pishrink.sh"]
  }

  post-processor "shell-local" {
    inline = ["chmod +x pishrink.sh"]
  }

  post-processor "shell-local" {
    inline = ["./pishrink.sh output-arm-image/image"]
  }

  post-processor "compress" {
  }
}
