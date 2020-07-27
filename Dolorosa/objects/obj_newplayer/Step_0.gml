/// @description Insert description here
// You can write your code in this editor
#region speed management
	if(hinput=0&&vinput=0&&speed>0){
			speed=max(0,speed-acceleration)
		}
	speed=min(speed,maxspd)
#endregion
#region collision
	var free = 0
	for (var angle = 0;angle<=45; angle += 1){
			xtarg = x+lengthdir_x(speed,angle+direction)
			ytarg = y+lengthdir_y(speed,angle+direction)
			if !place_meeting(xtarg,ytarg,obj_obstacle){
				direction = direction + angle
				free=free or 1
				break;
			}
		}
		
	for (var angle = 0;angle<=45; angle += 1){
			xtarg = x+lengthdir_x(speed,-angle+direction)
			ytarg = y+lengthdir_y(speed,-angle+direction)
			if !place_meeting(xtarg,ytarg,obj_obstacle){
				direction = direction -angle
				free=free or 1
				break;
			}
		}
	speed*=free
#endregion