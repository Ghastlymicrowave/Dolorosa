




	if spawntime=0{
		
		
if place_meeting(x,y,obj_player)&&fadeouttime=0{
	
	obj_player.gamepaused=1
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

obj_camera_follow.x=target_x
obj_camera_follow.y=target_y
obj_camera_place.x=target_x
obj_camera_place.y=target_y

var centerx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2
var centery=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2

direction = point_direction(centerx,centery,mouse_x,mouse_y)
speed = point_distance(centerx,centery,mouse_x,mouse_y)*obj_camera_place.distancefactor

if obj_player.inventoryopen=1 then speed=0
obj_camera_follow.x+=hspeed
obj_camera_follow.y+=vspeed
speed=0	
		}
		}
if spawntime>0{

if !place_meeting(x,y,obj_player)&&obj_player.spd!=0 {spawntime--} else spawntime=2
	
}