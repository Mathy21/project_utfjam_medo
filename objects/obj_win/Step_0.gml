if(instance_exists(obj_player) && obj_player.keys_num >= 3){
	var _col = place_meeting(x,y,obj_player);
	if(_col){
		if(sequence){
			var _x1, _y1,_x2,_y2;
			var _cam = view_get_camera(0);
			_x1 = camera_get_view_x(_cam);
			_x2 = camera_get_view_width(_cam);
			_y1 = camera_get_view_y(_cam);
			_y2 = camera_get_view_height(_cam);
			layer_sequence_create("Assets_1",_x1 + _x2/2,_y1 + _y2/2,sq_vitoria);
			sequence = false;
		}
		alarm[0] = 180;
	}
}