# Exile-Pods
Lock/Unlock, repair, flip, check state and skins.
----------
It's for Exile IgiLoad with TaruPodMod. That you can found [here](http://www.exilemod.com/topic/1018-exile-igiload-with-tarupodmod/).

With this:
  * Lock/Unlock in scroll menu. 
  * To repair, you use new Exile Repair Function (with the progress bar).
  * You can also check if the pod need to be repair when is unlock.
  * And adding Pods to the Vehicle Customs for ground vehicles to buy their skins.
  (note the names of the skins, they are not all as optimal pods models)

#####Install:

1 - Copy and paste what there is inside each class in config.cpp in each respective class of your config.cpp in your mission.pbo

2 - Put the two folders "addons" and "Custom" in your mission.pbo

#####BattlEye:
Add this in script.txt at the end of line who start with `7 exec`:
```
!="_this execVM 'addons\Check_state_of_object.sqf';"
```
