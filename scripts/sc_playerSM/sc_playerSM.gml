// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_idle(){
	animation_start(sprite_grid[# dir,0]);
	var _up, _down, _left, _right;
	_up		=keyboard_check(ord("W"));
	_down	=keyboard_check(ord("S")); 
	_left	=keyboard_check(ord("A")); 
	_right	=keyboard_check(ord("D"));
	
	if(_up || _down || _left || _right){
		state = PLAYER_STATES.WALK;
	}
	if(keyboard_check_pressed(ord("C"))){
		state = PLAYER_STATES.IDLE_CROUCH;
	}
	if((_up || _down || _left || _right) && (keyboard_check_pressed(ord("C")))){
		state = PLAYER_STATES.CROUCH;
	}
}

function player_state_walk(){
	animation_start(sprite_grid[# dir,1]);
	move();
	
	if(vel_h == 0 && vel_v == 0){
		state = PLAYER_STATES.IDLE;
	}
	if(keyboard_check_pressed(ord("C")) && (vel_h == 0 && vel_v == 0)){
		state = PLAYER_STATES.IDLE_CROUCH;
	}
	if(keyboard_check_pressed(ord("C"))){
		state = PLAYER_STATES.CROUCH;
	}
}

function player_state_crouch(){
	move_crouch();
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