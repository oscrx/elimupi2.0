# Using packer to build the raspberry pi image

Packer plugin used: [packer-builder-arm-image](https://github.com/solo-io/packer-builder-arm-image)

Dependencies:

- `packer` - Well..
- `kpartx` - mapping the partitons to mountable devices
- `qemu-user-static` - Executing arm binaries
- `golang-go` - Building the plugin with go

Ubuntu install (20.04.03 server):

```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update && sudo apt install -y packer kpartx qemu-user-static golang-go
```

Building the plugin: (from the packer directory)

```bash
go get github.com/solo-io/packer-builder-arm-image
mv ~/go/bin/packer-builder-arm-image .
```

Building the image: (from the packer directory)

```bash
packer build image.pkr.hcl
```

Profit.
