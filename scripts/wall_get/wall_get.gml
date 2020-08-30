// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wall_get(){
var targ = argument[0]
var startx = targ.x
var starty = targ.y
var endx = targ.x+lengthdir_x(targ.sprite_width,targ.image_angle)
var endy = targ.y+lengthdir_y(targ.sprite_width,targ.image_angle)
var out 
out[0]=startx
out[1]=starty
out[2]=endx
out[3]=endy
return out
}

function wall_move(){
var targ = argument[0]
targ.x=argument[1]
targ.y=argument[2]
var ang = point_direction(argument[1],argument[2],argument[3],argument[4])
var dist = point_distance(argument[1],argument[2],argument[3],argument[4])
targ.image_angle = ang
targ.image_xscale = 1
targ.image_xscale = dist/targ.sprite_width
}