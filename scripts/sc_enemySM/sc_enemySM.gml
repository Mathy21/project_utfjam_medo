// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_state_neutral(){
	move_enemy_idle();
	if(seesPlayer == true){
		state = ENEMY_STATES.AGRO;
	}
}

function enemy_state_agro(){
	move_enemy_chase();
	if(seesPlayer == false){
		state = ENEMY_STATES.NEUTRAL;
	}
}