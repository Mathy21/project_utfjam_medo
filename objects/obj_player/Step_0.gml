/// @description Insert description here
// You can write your code in this editor

script_execute(state_array[state]);

// Eixo X
var _col = instance_place(x+vel_h,y,obj_wall);
if(_col){
	if(vel_h > 0){
		x = _col.bbox_left+(x - bbox_right);	
	}
	if(vel_h < 0){
		x = _col.bbox_right+(x-bbox_left);	
	}
	vel_h = 0;
}
// Eixo Y
var _col = instance_place(x,y+vel_v,obj_wall);
if(_col){
	if(vel_v > 0){
		y = _col.bbox_top+(y-bbox_bottom);	
	}
	if(vel_v < 0){
		y = _col.bbox_bottom+(y-bbox_top);	
	}
	vel_v = 0;
}