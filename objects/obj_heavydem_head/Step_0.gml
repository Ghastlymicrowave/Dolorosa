/// @description Insert description here
// You can write your code in this editor
dinput=point_direction(x,y,obj_heavydem_body.x,obj_heavydem_body.y)
if(distance_to_object(obj_heavydem_body)>length){
	
	motion_add(dinput,(distance_to_object(obj_heavydem_body)-length)/elasticity)
	
	}else{}
speed-=2
speed=max(speed,0)
speed=min(speed,force)
