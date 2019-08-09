# XM8RespectTransfer
XM8Respect Transfer

  1. [Client] Add the Name, Image and exec to your xm8_apps_init.sqf file, image is inside of image folder and XM8RespectTransfer Folder in xm8apps folder
  
  2. [Client] At the top of your config.cpp file Paste #include "CfgNetworkMessages.hpp" //and #include "CfgNotifications.hpp"

  3. [Client] Edit config on top of XM8 XM8RespectTransfer.. Good to go!

  4. [Server] Open exile_server pbo\code\ExileServer_system_network_dispatchIncomingMessage.sqf and replace the edited lines or overwrite. If you have advanced banking installed then the file should be the same. File edits are marked.

  5. [Server] Place the exile_respect pbo in your server and boot it up! you are good to go

Please ask any questions on the forum post if you need.
