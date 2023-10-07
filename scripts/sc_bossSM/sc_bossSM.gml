function boss_state_idle(){
	randomize();
	vspd = 0;
	hspd = 0;
	if(walk_timer > 0){
		walk_timer--;	
	}
		else{
			dir = irandom_range(0,359);
			walk_timer = irandom_range(30,240);
			state = BOSS_STATES.MOVE;	
		}
		
		if(instance_exists(obj_player) && point_distance(x,y,obj_player.x,obj_player.y) < 800){
			state = BOSS_STATES.FOLLOW;	
		}
}

function boss_state_move(){
	randomize();
	if(walk_timer > 0){
		hspd = lengthdir_x(spd,dir);
		vspd = lengthdir_y(spd,dir);
		var _col = instance_place(x+hspd,y,obj_wall);
		if(_col){
			if(hspd > 0)
				x = _col.bbox_left + (x-bbox_right);
			if(hspd < 0)
				x = _col.bbox_right + (x-bbox_left);
			walk_timer = irandom_range(30,240);	
			state = BOSS_STATES.IDLE;
		}
		
		var _col = instance_place(x,y+vspd,obj_wall);
		if(_col){
			if(vspd > 0)
				y = _col.bbox_top + (y-bbox_bottom);
			if(vspd < 0)
				y = _col.bbox_bottom + (y-bbox_top);
				
			walk_timer = irandom_range(30,240);	
			state = BOSS_STATES.IDLE;
		}
		walk_timer--;
	}
		else{
			hspd = 0;
			vspd = 0;
			walk_timer = irandom_range(30,240);
			state = BOSS_STATES.IDLE;	
		}
}

function boss_state_follow(){
	if(instance_exists(obj_player) && point_distance(x,y,obj_player.x,obj_player.y) < 800){
		var _dir = point_direction(x,y,obj_player.x,obj_player.y);	
		hspd = lengthdir_x(spd,_dir);
		vspd = lengthdir_y(spd,_dir);
	}
		else{
			walk_timer = irandom_range(30,240);
			state = BOSS_STATES.IDLE;	
		}
}