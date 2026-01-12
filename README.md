### WARNING
> DO NOT RUN THESE SCRIPTS ON UBUNTU BASED DISTRIBUTIONS

---

# Info

### known bugs

* No bugs found yet.

### Supported Distros

* Debian Bookworm (Old Stable)
* Debian Trixie (Stable)
* Debian Armbian Bookworm (Old Stable)
* Debian Armbian Trixie (Stable)

### QnA

* Q: What is the point?
* A: To make DEs run on low end hardware. (example:embedded devices and thin clients etc.)
* Q: If i have 2 gb of ram wil it run?
* A: Yes but you need to use lxde,mate,xfce.
* Q: Do you support Armbian?
* A: Yes.
* Q: why are you not using Firefox,Brave,etc?
* A: we use what works on as many hardware platforms as posible.
* Q: What about Brave,etc?
* A: we use what is located in the debian repos.

### How to Start using on PC/Server/Raspberry PI
### NOTE: Armbian scripts are for bash only
```
run.sh
```
### How to Start using on ARM/ARM Server
```
run.sh
```

### configuration: GPU Intel VAAPI Driver
### NOTE: nonfree must be enabled before running this.
### NOTE: This Driver will remove the Intel media driver pakage.

This package contains the video decode and encode driver backend for the Intel G45 chipsets and Intel HD Graphics for the Intel Core processor family. 
The supported platforms include:

 * Cantiga, Intel GMA 4500MHD (GM45)
 * Ironlake, Intel HD Graphics for 2010 Intel Core processor family
 * Sandy Bridge, Intel HD Graphics for 2011 Intel Core processor family
 * Ivy Bridge
 * Haswell
 * Broadwell
 * Skylake
 * Kaby Lake
 * Coffee Lake
 * Cannon Lake

This package contains also contains the non-free encode shaders for VP8, VP9, HEVC and AVC for generation 7.5 hardware or newer.

* To install run: `sudo apt install i965-va-driver-shaders`

### configuration: Network Manager

* Wired Networks are Unmanaged by Default.

* As of Debian 6.0 "Squeeze", NetworkManager does not manage any interface defined in /etc/network/interfaces by default.

* Unmanaged devices means NetworkManager doesn't handle those network devices. This occurs when two conditions are met:

* The file /etc/network/interfaces contains anything about the interface, even:
  ```
  allow-hotplug eth0
  iface eth0 inet dhcp
  ```
  And /etc/NetworkManager/NetworkManager.conf contains:
  ```
  [main]
  plugins=ifupdown,keyfile

  [ifupdown]
  managed=false
  ```

* Enabling Interface Management

* If you want NetworkManager to handle interfaces that are enabled in /etc/network/interfaces:

  Set managed=true in /etc/NetworkManager/NetworkManager.conf.

* Restart NetworkManager: sudo service network-manager restart

* Starting with Debian 11 (bullseye), use: `sudo service NetworkManager restart`
