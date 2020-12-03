/// @description Insert description here
// You can write your code in this editor
if(instance_exists(leader)){
	if(distance_to_object(leader)>distance){
		motion_add(point_direction(x,y,leader.x,leader.y),1.1)
		hspeed+=((x+leader.x)/2-x)/5
		vspeed+=((y+leader.y)/2-y)/5
	}else{
		//motion_add(point_direction(x,y,leader.x,leader.y),-1)
		speed=speed/(1+slow)
	}
	while(distance_to_object(leader)>maxdist){
	x+=lengthdir_x(1,point_direction(x,y,leader.x,leader.y))
	y+=lengthdir_y(1,point_direction(x,y,leader.x,leader.y))
	}
}
if(instance_exists(follower)){
	if(distance_to_object(follower)>distance){
		motion_add(point_direction(x,y,follower.x,follower.y),1)
	}else{
		speed=speed/(1+slow)
	}
	while(distance_to_object(follower)>maxdist){
	x+=lengthdir_x(1,point_direction(x,y,follower.x,follower.y))
	y+=lengthdir_y(1,point_direction(x,y,follower.x,follower.y))
	}
}

speed=min(speed,maxspd)