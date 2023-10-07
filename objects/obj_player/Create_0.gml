/// @description Insert description here
// You can write your code in this editor
step_sound = true;
run_sound = true;
atk_sound = true;
keys_num = 0;
hp = 100;
sanity = 10000;
max_stamina = 20000;
stamina = 100;
coins = 0;
has_yellow_key = false;
//crouched = false;
enemy_list = ds_list_create();

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
	sprite_grid[# 0,1] = spr_player_move_right;
	sprite_grid[# 1,1] = spr_player_move_back;
	sprite_grid[# 2,1] = spr_player_move_left;
	sprite_grid[# 3,1] = spr_player_move_front;
}

vel_corre = 6;

move = function(){
	audio_stop_sound(snd_run_footstep);
	run_sound = true;
	var _up, _down, _right, _left;
	//var x_antigo = x;
    //var y_antigo = y;
	_up = keyboard_check(ord("W"));
	_down = keyboard_check(ord("S"));
	_left = keyboard_check(ord("A"));
	_right = keyboard_check(ord("D"));
    //if (collision_rectangle(x, y, x + sprite_width, y + sprite_height, obj_wall, false, true)) {
    //    x = x_antigo;
    //    y = y_antigo;
    //}

	var _dir = point_direction(0,0,(_right-_left),(_down-_up));
	if(_up || _down || _left || _right){
		if(step_sound){
			audio_play_sound(snd_walk_footstep,0,true);
			step_sound = false;
		}
		vel_h = lengthdir_x(vel_max,_dir);
		vel_v = lengthdir_y(vel_max,_dir);
	}
		else{
			audio_stop_sound(snd_walk_footstep);
			step_sound = true;
			vel_h = 0;
			vel_v = 0;
		}
}

move_crouch = function(){
	step_sound = true;
	audio_stop_sound(snd_walk_footstep);
	audio_stop_sound(snd_run_footstep);
	run_sound = true;
	var _up, _down, _right, _left;
	_up = keyboard_check(ord("W"));
	_down = keyboard_check(ord("S"));
	_left = keyboard_check(ord("A"));
	_right = keyboard_check(ord("D"));

	//var x_antigo = x;
    //var y_antigo = y;
	
	var _dir = point_direction(0,0,(_right-_left),(_down-_up));

	if(_up || _down || _left || _right){
		vel_h = lengthdir_x(vel_min,_dir);
		vel_v = lengthdir_y(vel_min,_dir);
	}else{
			vel_h = 0;
			vel_v = 0;
	}

}

move_run = function(){
	step_sound = true;
	audio_stop_sound(snd_walk_footstep);
	var _up, _down, _right, _left;
	_up = keyboard_check(ord("W"));
	_down = keyboard_check(ord("S"));
	_left = keyboard_check(ord("A"));
	_right = keyboard_check(ord("D"));
	
	var _dir = point_direction(0,0,(_right-_left),(_down-_up));
	if(_up || _down || _left || _right){
		if(run_sound){
			audio_play_sound(snd_run_footstep,0,true);
			run_sound = false;
		}
		vel_h = lengthdir_x(vel_corre,_dir);
		vel_v = lengthdir_y(vel_corre,_dir);
	}
		else{
			audio_stop_sound(snd_run_footstep);
			run_sound = true;
			vel_h = 0;
			vel_v = 0;
		}

	stamina -=5;
	//if (collision_rectangle(x, y, x + sprite_width, y + sprite_height, obj_wall, false, true)) {
    //    x = x_antigo;
	//	y = y_antigo;
    //}
}

damage_sys = function(dmg){
	if(dmg == undefined){
        dmg =1;
    }
    if(dmg > 0 && hp > 0){
        hp -= dmg;
    }
    if(hp<=0){
       instance_destroy();
    }
}

sanity_sys = function(hit){
	if(hit == undefined){
		hit =1;
	}
	if(hit > 0 && sanity > 0){
		sanity -= hit;
	}
	if(sanity<=0){
		instance_destroy();
	}
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
state_array[PLAYER_STATES.ATK]			= player_state_atk;
