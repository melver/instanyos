=============================
Chromebook with ARM processor
=============================

Summary of how to install ArchlinuxARM on the Chromebook.

Step 1: Boot into developer mode
================================

The first step is to start the Chromebook in developer mode:
    1. ESC + Refresh + Power
    2. At recovery screen: CTRL-D and reboot
    3. CTRL-D again to continue to boot into developer mode
    4. While logged out of ChromeOS: CTRL-ALT-⇨
    5. Login as user ``chronos``
    6. Copy this folder to the Chromebook
    7. ``for x in powered powerm dbus syslog tcsd cras ui; do initctl stop $x; done``

Step 2: Partition SSD
=====================

.. code-block:: sh

    bash bootstrap

Step 3: Install ArchlinuxARM
============================

After rebooting, continue with:

.. code-block:: sh

    bash boostrap

Step 4: Prioritize ArchlinuxARM on boot
=======================================

If everything worked, run the following to make the boot-order permanent:

.. code-block:: sh

    cgpt add -i 6 -P 5 -S 1 /dev/mmcblk0

To boot ChromeOS on next boot, run:

.. code-block:: sh

    cgpt add -i 6 -P 0 -S 1 /dev/mmcblk0

Step 5: Chromebook specific configuration
=========================================

Chromebook specific packages
----------------------------
    - xf86-video-armsoc
    - x86-input-multitouch (AUR)
    - Build and install packages found in ``pkgs``

ALSA
----
Copy /usr/share/alsa/ucm/ from ROOT-A ???

References
==========
    #. http://www.chromium.org/chromium-os/developer-information-for-chrome-os-devices/samsung-arm-chromebook
    #. http://archlinuxarm.org/platforms/armv7/samsung-chromebook
    #. http://wiki.debian.org/InstallingDebianOn/Samsung/ARMChromebook
    #. http://www.chromium.org/chromium-os/developer-information-for-chrome-os-devices/cr-48-chrome-notebook-developer-information/how-to-boot-ubuntu-on-a-cr-48
    #. http://chromeos-cr48.blogspot.co.uk/2012/04/chrubuntu-1204-now-with-double-bits.html

