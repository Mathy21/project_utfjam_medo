// Defina as variáveis que controlam o movimento
vida = 10;
vel = 5;
visionConeLeft = 45;
visionConeRight = -45;
seesPlayer = false;
hvel = 0;
vvel = 0;

// Defina uma variável que armazena o tempo em passos para mudar a direção do movimento
tempo = 60;

// Defina um alarme que chama a função move_enemy_idle a cada intervalo de tempo
alarm[0] = tempo;

// Variáveis para o alvo (o boneco a ser perseguido)
target = noone; // Inicialmente, não há alvo
targetRadius = 100; // Raio de detecção de alvo

// Defina a função move_enemy_idle que atualiza as variáveis hvel e vvel com valores randômicos
move_enemy_idle = function(){
    _right = choose(0, 1); // Escolhe aleatoriamente entre 0 e 1
    _left = choose(0, 1);
    _up = choose(0, 1);
    _down = choose(0, 1);
    hvel = (_right - _left) * vel;
    vvel = (_down - _up) * vel;
    
    // Salva a posição atual
    var x_antigo = x;
    var y_antigo = y;
    
    // Atualiza a posição
    x += hvel;
    y += vvel;
    
    // Verifica colisão com objetos ou limites do ambiente
    if (collision_rectangle(x, y, x + sprite_width, y + sprite_height, obj_wall, false, true)) {
        // Se houve uma colisão, restaure a posição anterior
        x = x_antigo;
        y = y_antigo;
    }
    
    // Verifica se há um alvo dentro do campo de visão
    target = instance_place(x, y, obj_player); // Verifica se um jogador está dentro do campo de visão
    if (target != noone) {
		seesPlayer = true;
      
    }
    // Define um novo alarme para a próxima mudança de direção
    alarm[0] = tempo;
}


//move_enemy_chase(){
		
//}


move_enemy_chase = function(){
	var x_antigo = x;
    var y_antigo = y;
    
    // Verifica colisão com objetos ou limites do ambiente

   var dir_to_target = point_direction(x, y, target.x, target.y);
     hvel = lengthdir_x(vel, dir_to_target);
     vvel = lengthdir_y(vel, dir_to_target);
	 x += hvel;
     y += vvel;
	 // Salva a posição atual

    if (collision_rectangle(x, y, x + sprite_width, y + sprite_height, obj_wall, false, true)) {
        // Se houve uma colisão, restaure a posição anterior
        x = x_antigo;
        y = y_antigo;
    }

	target = instance_place(x, y, obj_player);
	if(target == noone){
		seesPlayer = false;
	}
	  // O jogador está dentro do campo de visão, siga-o

}

damage_sys = function(dmg){
	if(dmg == undefined){
		dmg =1;
	}
	if(dmg > 0 && vida > 0){
		vida -= dmg;
	}
	if(vida<=0){
		//state = ENEMY_STATES.DIE;
		instance_destroy();
	}
}

enum ENEMY_STATES {
	NEUTRAL,
	AGRO,
	DAMAGED,//TO-DO
	DIE,//TO-DO
	ATK//TO-DO
	
}

state = ENEMY_STATES.NEUTRAL;
state_array[ENEMY_STATES.NEUTRAL] = enemy_state_neutral;
state_array[ENEMY_STATES.AGRO] = enemy_state_agro;

