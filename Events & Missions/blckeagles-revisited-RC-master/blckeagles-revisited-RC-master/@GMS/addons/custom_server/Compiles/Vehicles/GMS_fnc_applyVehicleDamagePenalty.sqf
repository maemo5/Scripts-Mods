/*

	By Ghostrider-GRG-

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

	private["_vd"];
	params["_vk"];
	_vd = damage _vk;
	_vk setDamage (_vd + blck_RunGearDamage);
