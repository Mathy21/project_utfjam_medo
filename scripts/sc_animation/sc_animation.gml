function animation_start(_sprite){
	if(sprite_index != _sprite){
		image_index = 0;
		sprite_index = _sprite;
		if(argument_count > 1){
			var _mask = argument[1];
			mask_index = _mask;
		}else{
			mask_index = sprite_index;
		}
	}
}

function animation_end(){
    var _sprite, _index;
    _sprite = sprite_index;
    _index = image_index;

    var _speed, _type;
    _speed = sprite_get_speed(_sprite)*image_speed;
    _type = sprite_get_speed_type(_sprite);
    if(_type == spritespeed_framespersecond){
        _speed /= room_speed;
    }

    return _index + _speed >= sprite_get_number(_sprite);
}