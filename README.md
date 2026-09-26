## HillOS has released!

HillOS has finally reached the release stage: now it is a completely independent operating system with its own development API and wonderful [illustrated wiki](https://github.com/IgorTimofeev/MineOS/wiki) of it's usage. 
HillOS is a GUI based operating system for the OpenComputers Minecraft mod. It has extensive and powerful customisation abilities as well as an app store to download apps.
## Here's a list of a few features:

-   Multitasking
-   Double buffered graphical user interface
-   Language packs and software localization
-   Multiple user profiles with password authentication
-   Own EEPROM firmware with boot volume choose/format/rename features and Internet Recovery mode
-   File sharing over the local network via modems
-   Client connections to real FTP servers
-   An internal IDE with syntax highlighting and debugger
-   Error reporting system with the possibility to send information to developers
-   Animations, wallpapers, color schemes and huge customization possibilities
-   Open source system API and detailed illustrated documentations

## How to install?

The easiest way is to use default **pastebin** script. Insert an OpenOS floppy disk to computer, insert an Internet Card, turn computer on and type the following to console to install HillOS:

	pastebin run pCrt3XCT

You can paste it to console using middle mouse button or insert key (by default). If for some reason the pastebin method isn't available to you (for example, it's blacklisted on game server or blocked by Internet provider), use alternative command to download the installer directly from the Github page:

	wget -f https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/LittleVally/Installer/BIOS.lua /tmp/bios.lua && flash -q /tmp/bios.lua && reboot

After a moment, a nice system installer will be shown. You will be prompted to select your preferred language, boot volume (can be formatted if needed), create a user profile and customize some settings

## Requirements

- Internet Card
- Tier 3 or higher CPU
- Tier 3 or higher GPU
- 2 slots of Tier 3.5 or higher RAM
- Tier 2 or higher Screen
- Tier 3 or higher Hard Disk Drive

## Supported Versions
- OpenComputers 1.7.6 and up
- OpenComputers: Rebooted (wip)

## How to create programs that works with API?

[MineOS Wiki (HillOS Is MineOS based)](https://github.com/IgorTimofeev/MineOS/wiki)

## Thank you to MineOS Development Team
 
 Thank you for keeping MineOS alive.  [MineOS Repository](https://github.com/IgorTimofeev/MineOS)
