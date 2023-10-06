/// @description Insert description here
// You can write your code in this editor

hp = 100;
sanidade = 100;
//crouched = false;

//Declarando variáveis para movimento
vel_v = 0;
vel_h = 0;
vel_min = 2;
vel_max = 4;
// Sprite e animação
dir = 0;
sprite_grid = ds_grid_create(4,2);
set_sprite_grid = function(){
	// Idle
	sprite_grid[# 0,0] = spr_player_idle_right;
	sprite_grid[# 1,0] = spr_player_idle_back;
	sprite_grid[# 2,0] = spr_player_idle_left;
	sprite_grid[# 3,0] = spr_player_idle_front;
	// Movement
	sprite_grid[# 0,1] = spr_player_idle_right;
	sprite_grid[# 1,1] = spr_player_idle_back;
	sprite_grid[# 2,1] = spr_player_idle_left;
	sprite_grid[# 3,1] = spr_player_idle_front;
}
move = function(){
	var _up, _down, _right, _left;
	_up = keyboard_check(ord("W"));
	_down = keyboard_check(ord("S"));
	_left = keyboard_check(ord("A"));
	_right = keyboard_check(ord("D"));
	
	vel_h = (_right - _left)*vel_max;
	vel_v = (_down - _up)*vel_max;
	x+=vel_h;
	y+=vel_v;
}

move_crouch = function(){
	var _up, _down, _right, _left;
	_up = keyboard_check(ord("W"));
	_down = keyboard_check(ord("S"));
	_left = keyboard_check(ord("A"));
	_right = keyboard_check(ord("D"));
	
	vel_h = (_right - _left)*vel_min;
	vel_v = (_down - _up)*vel_min;
	x+=vel_h;
	y+=vel_v;
}

enum PLAYER_STATES {
	IDLE,
	WALK,
	IDLE_CROUCH,
	CROUCH,
	ATK,
	TKDMG,
	DIE,
	WPN0,
	WPN1,
	WPN2
}

state = PLAYER_STATES.IDLE;
state_array[PLAYER_STATES.IDLE]			= player_state_idle;
state_array[PLAYER_STATES.WALK]			= player_state_walk;
state_array[PLAYER_STATES.IDLE_CROUCH]	= player_state_crouch_idle;
state_array[PLAYER_STATES.CROUCH]		= player_state_crouch;
