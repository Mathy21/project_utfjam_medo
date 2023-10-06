/// @description Insert description here
// You can write your code in this editor

hp = 100;
sanidade = 100;
max_stamina = 100;
stamina = 100;
//crouched = false;

//Declarando variáveis para movimento
vel_v = 0;
vel_h = 0;
vel_min = 2;
vel_max = 4;
vel_corre = 6;

move = function(){
	var _up, _down, _right, _left;
	//var x_antigo = x;
    //var y_antigo = y;
	_up = keyboard_check(ord("W"));
	_down = keyboard_check(ord("S"));
	_left = keyboard_check(ord("A"));
	_right = keyboard_check(ord("D"));
	vel_h = (_right - _left)*vel_max;
	vel_v = (_down - _up)*vel_max;
	x+=vel_h;
	y+=vel_v;
    //if (collision_rectangle(x, y, x + sprite_width, y + sprite_height, obj_wall, false, true)) {
    //    x = x_antigo;
    //    y = y_antigo;
    //}
}

move_crouch = function(){
	var _up, _down, _right, _left;
	_up = keyboard_check(ord("W"));
	_down = keyboard_check(ord("S"));
	_left = keyboard_check(ord("A"));
	_right = keyboard_check(ord("D"));
	//var x_antigo = x;
    //var y_antigo = y;
	
	vel_h = (_right - _left)*vel_min;
	vel_v = (_down - _up)*vel_min;
	x+=vel_h;
	y+=vel_v;
	//if (collision_rectangle(x, y, x + sprite_width, y + sprite_height, obj_wall, false, true)) {
    //    x = x_antigo;
	//	y = y_antigo;
    //}
}

move_run = function(){
	var _up, _down, _right, _left;
	_up = keyboard_check(ord("W"));
	_down = keyboard_check(ord("S"));
	_left = keyboard_check(ord("A"));
	_right = keyboard_check(ord("D"));
	//var x_antigo = x;
    //var y_antigo = y;
	vel_h = (_right - _left)*vel_corre;
	vel_v = (_down - _up)*vel_corre;
	x+=vel_h;
	y+=vel_v;
	stamina -=5;
	//if (collision_rectangle(x, y, x + sprite_width, y + sprite_height, obj_wall, false, true)) {
    //    x = x_antigo;
	//	y = y_antigo;
    //}
}

enum PLAYER_STATES {
	IDLE,
	WALK,
	RUNNING,
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
state_array[PLAYER_STATES.RUNNING]		= player_state_run;
state_array[PLAYER_STATES.IDLE_CROUCH]	= player_state_crouch_idle;
state_array[PLAYER_STATES.CROUCH]		= player_state_crouch;
