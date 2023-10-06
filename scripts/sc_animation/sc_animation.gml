function animation_start(_sprite){
	if(sprite_index != _sprite){
		image_index = 0;
		sprite_index = _sprite;
		if(argument_count > 1){
			var _mask = argument[1];
			mask_index = _mask;
		}
	}
}