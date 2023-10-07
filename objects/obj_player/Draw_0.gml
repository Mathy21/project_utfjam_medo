/// @description Insert description here
// You can write your code in this editor

draw_self();

if(mask_index!= -1 && mask_index != sprite_index){
	draw_sprite(mask_index, image_index,x,y);
}
draw_text(x,y+80, stamina);
draw_text(x,y+100,state);
draw_text(x,y+60,sanity);

draw_text(x,y-sprite_height/2,dir);