draw_self();

if((mask_index != -1)&&(mask_index != sprite_index)){
	draw_sprite(mask_index,image_index,x,y);
}
/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_text(x,y+sprite_height/2,vida);
