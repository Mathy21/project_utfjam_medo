// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_atk(dmg){
	var col = instance_place(x,y,obj_player);
	if(instance_exists(obj_player)&&(col)&&(damaged == false)){
		with(obj_player){
			damage_sys(dmg);
		}
		damaged = true;
	}
}