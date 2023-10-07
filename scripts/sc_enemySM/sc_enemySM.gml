// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_state_neutral(){
	move_enemy_idle();
	if(vida <=0){
		state = ENEMY_STATES.DIE;
	}
	if(seesPlayer == true){
		state = ENEMY_STATES.AGRO;
	}
}

function enemy_state_agro(){
	animation_start(spr_enemy_placeholder);
	move_enemy_chase();
	damaged = false;
	if(vida <=0){
		state = ENEMY_STATES.DIE;
	}
	if(seesPlayer == false){
		state = ENEMY_STATES.NEUTRAL;
	}
	if(instance_exists(obj_player)){
		if(point_distance(x,y,obj_player.x,obj_player.y) <= atkRange){
			state = ENEMY_STATES.ATK;
		}
	}
}

function enemy_state_atk(){
	animation_start(spr_enemy_atk_placeholder,spr_enemy_atk_placeholder);
	enemy_atk(10);
	if(vida <=0){
		state = ENEMY_STATES.DIE;
	}
//	if(instance_exists(obj_player)){
//		if(point_distance(x,y,obj_player.x,obj_player.y) > atkRange){
//			state = ENEMY_STATES.AGRO;
//		}
//	}
 if(animation_end()){
	 state = ENEMY_STATES.AGRO;
	}
}

function enemy_state_die(){
	//instance_create_layer(x,y,"Instances",obj_coin);
	instance_destroy();
}