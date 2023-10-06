// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_idle(){
	animation_start(sprite_grid[# dir,0]);
	var _up, _down, _left, _right;
	_up		=keyboard_check(ord("W"));
	_down	=keyboard_check(ord("S")); 
	_left	=keyboard_check(ord("A")); 
	_right	=keyboard_check(ord("D"));
	
	if(stamina<max_stamina){
		stamina += 10;
	}
	
	if(_up || _down || _left || _right){
		state = PLAYER_STATES.WALK;
	}
	if(keyboard_check_pressed(ord("C"))){
		state = PLAYER_STATES.IDLE_CROUCH;
	}
	if((_up || _down || _left || _right) && (keyboard_check_pressed(ord("C")))){
		state = PLAYER_STATES.CROUCH;
	}
	if((keyboard_check(vk_shift)) && (_up || _down || _left || _right)){
		state = PLAYER_STATES.RUNNING;
	}
}

function player_state_walk(){
	animation_start(sprite_grid[# dir,1]);
	move();
	if(stamina<max_stamina){
		stamina += 5;
	}
	
	if(vel_h == 0 && vel_v == 0){
		state = PLAYER_STATES.IDLE;
	}
	if(keyboard_check_pressed(ord("C")) && (vel_h == 0 && vel_v == 0)){
		state = PLAYER_STATES.IDLE_CROUCH;
	}
	if(keyboard_check_pressed(ord("C"))){
		state = PLAYER_STATES.CROUCH;
	}
	if(keyboard_check(vk_shift) && stamina >= 20){
		state = PLAYER_STATES.RUNNING;
	}
}

function player_state_crouch(){
	move_crouch();
	
	if(stamina<max_stamina){
		stamina += 10;
	}
	
	if(vel_h == 0 && vel_v == 0){
		state = PLAYER_STATES.IDLE_CROUCH;
	}
	if(keyboard_check_pressed(ord("C")) && (vel_h == 0 && vel_v == 0)){
		state = PLAYER_STATES.IDLE;
	}
	if(keyboard_check_pressed((ord("C")))){
		state = PLAYER_STATES.WALK;
	}
}

function player_state_crouch_idle(){
	var _up, _down, _left, _right;
	_up		=keyboard_check(ord("W"));
	_down	=keyboard_check(ord("S")); 
	_left	=keyboard_check(ord("A")); 
	_right	=keyboard_check(ord("D"));
	
	if(stamina<max_stamina){
		stamina +=15;
	}
	
	if(keyboard_check_pressed(ord("C"))){
		state = PLAYER_STATES.IDLE;
	}
	if(_up || _down || _left || _right){
		state = PLAYER_STATES.CROUCH;
	}
	if((_up || _down || _left || _right) &&(keyboard_check_pressed(ord("C")))){
		state = PLAYER_STATES.WALK;
	}
}

function player_state_run(){
	move_run();
	
	if(vel_h == 0 && vel_v == 0){
		state = PLAYER_STATES.IDLE;
	}
	if(stamina<=0 || keyboard_check_released(vk_shift)){
		state = PLAYER_STATES.WALK
	}
}