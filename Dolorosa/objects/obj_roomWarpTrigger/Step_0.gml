




	if spawntime=0{
		
		
if place_meeting(x,y,obj_player)&&fadeouttime=0{
	
	obj_player.interactState=3
	obj_player.lockeddir=obj_player.lastdir
	fadeouttime++}
	}
if fadeouttime!=0{
		fadeouttime++
		
		if fadeouttime=global.fadespeed{
			obj_player.fadeintime=global.fadespeed
room=gotoRoom	
obj_player.x=target_x
obj_player.y=target_y

centerx= window_get_width()/2 
centery= window_get_height()/2
var dirVar = point_direction(centerx,centery,window_mouse_get_x(),window_mouse_get_y())
var distVar = point_distance(centerx,centery,window_mouse_get_x(),window_mouse_get_y())*obj_camera_place.distancefactor
obj_camera_place.x=target_x+cos(dirVar*pi/180)*distVar
obj_camera_place.y=target_y-sin(dirVar*pi/180)*distVar


obj_camera_follow.x=obj_camera_place.x
obj_camera_follow.y=obj_camera_place.y
var centerx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2
var centery=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2

direction = point_direction(centerx,centery,mouse_x,mouse_y)
speed = point_distance(centerx,centery,mouse_x,mouse_y)*obj_camera_place.distancefactor

//if obj_player.interactState!=0 then s
speed=0
obj_camera_follow.x+=hspeed
obj_camera_follow.y+=vspeed
speed=0	
		}
		}
if spawntime>0{

if !place_meeting(x,y,obj_player)&&obj_player.spd!=0 {spawntime--} else spawntime=2
	
}