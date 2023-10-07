surf = noone;

desenha_surface = function(){
	if(!surface_exists(surf)){
		// Criando a surface
		surf = surface_create(room_width,room_height);
		// Definindo a surface "surf" como nosso target do draw
		surface_set_target(surf);
		// Limpando a surface
		draw_clear_alpha(c_black,0);
		// Resetando meu alvo(Voltando a ver a surface correta)
		surface_reset_target();
	}
		else{
			draw_surface(surf,0,0);		
		}
}

desenha_luz = function(){
	// Checando se a surf existe
	if(surface_exists(surf) && instance_exists(obj_player)){
		surface_set_target(surf);
		// Limpando a surface porque eu não quero algo desenhando toda hora
		// apenas uma tela preta
		// Resumindo, não deixa ficar desenhando infitas luzes ou qualquer coisa na surface
		draw_clear_alpha(c_black,1);
		gpu_set_blendmode(bm_subtract);
		var _variavel = random_range(-0.1,0.05)
		draw_sprite_ext(spr_luz,0,obj_player.x,obj_player.y,3+_variavel,3+_variavel,0,c_white,1);
		gpu_set_blendmode(bm_normal);
		surface_reset_target();
	}
}