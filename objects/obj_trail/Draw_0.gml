/// @description Insert description here
// You can write your code in this editor

if(follower!=noone){
	var w = sprite_get_width(tail_index)
	draw_sprite_ext(tail_index,0,x,y,point_distance(x,y,follower.x,follower.y)/w,image_xscale,point_direction(x,y,follower.x,follower.y),c_white,1)
	}
if(leader!=noone){
	var w = sprite_get_width(tail_index)
	var h = leader.image_xscale
	draw_sprite_ext(tail_index,0,x,y,point_distance(x,y,leader.x,leader.y)/w,h,point_direction(x,y,leader.x,leader.y),c_white,1)
	}
draw_set_color(c_white)
draw_self()