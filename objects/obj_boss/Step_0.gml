script_execute(states_array[state]);

x += hspd;
y += vspd;

if(instance_exists(obj_player)){
	if(point_distance(x,y,obj_player.x,obj_player.y) < 200){
		alarm[0] = irandom(120);	
	}
}