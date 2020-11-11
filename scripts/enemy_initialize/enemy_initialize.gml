// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_inputs_coward(range,flee){//cowardly pursuit AI
	var targ=instance_nearest(x,y,obj_player)
	dinput = -1
	dodge = 0
	attack = 0
	//approach
	if(point_distance(x,y,targ.x,targ.y)>range){
		dinput=point_direction(x,y,targ.x,targ.y)
	}
	
	//run away
	if(point_distance(x,y,targ.x,targ.y)<flee){
		dinput=point_direction(targ.x,targ.y,x,y)
		dodge=1
		
	}
	
	//attack
	if(dinput= -1){
		attack = 1
	}	
}

function enemy_inputs_strafe(range,dodgeangle){//strafe AI
	var targ=instance_nearest(x,y,obj_player)
	dinput = -1
	dodge = 0
	ainput = -1
	attack = 0
	//approach
	if(point_distance(x,y,targ.x,targ.y)>range){
		dinput=point_direction(x,y,targ.x,targ.y)
	}
	//attack and strafe
	if(point_distance(x,y,targ.x,targ.y)>range){
		dinput = point_direction(x,y,targ.x,targ.y)+dodgeangle
		dodge = 1
		attack = 1
	}
	
}
function enemy_inputs_lunge(range){//lunge AI
	var targ=instance_nearest(x,y,obj_player)
	dinput = -1
	dodge = 0
	attack = 0
	//approach
	if(point_distance(x,y,targ.x,targ.y)>range){
		dinput=point_direction(x,y,targ.x,targ.y)
	}
	
}