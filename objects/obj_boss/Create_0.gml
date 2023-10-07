vspd = 0;
hspd = 0;
spd = 2;
play_sound = false;

walk_timer = irandom_range(30,240);
choose_dir = false;
dir = 0;
enum BOSS_STATES{
	IDLE,
	MOVE,
	FOLLOW,
	ATK
}
state = BOSS_STATES.IDLE;
states_array[BOSS_STATES.IDLE] = boss_state_idle;
states_array[BOSS_STATES.MOVE] = boss_state_move;
states_array[BOSS_STATES.FOLLOW] = boss_state_follow;