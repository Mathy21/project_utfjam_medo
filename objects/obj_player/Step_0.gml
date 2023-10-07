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


//Verificando Inimigos em volta do personagem
var _col1,_col2,_col3;

_col1 = collision_circle(x,y,300,par_enemy,false,true);
_col2 = collision_circle(x,y,200,par_enemy,false,true);
_col3 = collision_circle(x,y,100,par_enemy,false,true);

if(_col3 != noone){
	_col1 = noone
	_col2 = noone
}
if(_col2 != noone){
	_col1 = noone;
}

if(_col1 != noone){
	sanity_sys(1);
}

if(_col2 != noone){
	sanity_sys(3);	
}

if(_col3 != noone){
	sanity_sys(5);
}
