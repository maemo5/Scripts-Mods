ACiDy ORS by [d4n1ch](mailto:d.e@acd.su)
========================================
Only Random Spawn
-----------------
for Arma 3 @Exile mod
---------------------

ACD_ORS Version
---------------
* 0.2

@Exile Version
---------------
* 0.9.20b "Tomato"

INSTALLATION:
----
#### SIMPLE:
* 1) Copy folder `overwrites` from `mpmissions\Exile.anymap` to your Exile mission pbo
* 2) Edit section `CfgExileCustomCode` inside `config.cpp` of your Exile mission pbo to include path to overwrite: 
```java
class CfgExileCustomCode 
{
	ExileClient_gui_selectSpawnLocation_show = "overwrites\exile_client\code\ExileClient_gui_selectSpawnLocation_show.sqf";
};
```
* 3) profit

CHANGELOG
---------
# 0.2
* Changes in directory structure

Tech
----

This release uses @Exile project to work:

* [@Exile](http://www.exilemod.com/) - Exile mod client files
* [@ExileServer](http://www.exilemod.com/) - Exile mod server files