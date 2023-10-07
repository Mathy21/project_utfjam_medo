// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_atk(dmg){
	var _hit_list = ds_list_create();
	var _col = instance_place_list(x,y,par_enemy, _hit_list, false);
	if(_col == true){
		for(var i=0; i<ds_list_size(_hit_list);i++){
			var _id = _hit_list[|i];
			if(ds_list_find_index(enemy_list,_id)==-1){
				ds_list_add(enemy_list,_id);
				if(instance_exists(_id)){
					with(_id){
						damage_sys(dmg);
					}
				}
			}
		}
	}
	ds_list_destroy(_hit_list);
}