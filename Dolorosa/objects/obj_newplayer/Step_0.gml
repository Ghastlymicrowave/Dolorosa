/// @description Insert description here
// You can write your code in this editor
#region speed management


	if(((hinput=0&&vinput=0))&&speed>0){
			speed=max(0,speed-acceleration)
		}else {speed=max(0,speed-acceleration/180*abs(angle_difference(direction,facing)))}
	speed=min(speed,maxspd)
#endregion
#region collision
	var free = 0
	var maxAngle = 45
	var controlDir = point_direction(0,0,hinput,vinput)
	for (var angle = 0;angle<=maxAngle; angle += 1){
			xtarg = x+lengthdir_x(speed,angle+direction)
			ytarg = y+lengthdir_y(speed,angle+direction)
			if !place_meeting(xtarg,ytarg,obj_obstacle)&&angle_difference(direction,controlDir)<maxAngle{
				direction = direction + angle
				free=free or 1
				break;
			}
		}
		
	for (var angle = 0;angle<=maxAngle; angle += 1){
			xtarg = x+lengthdir_x(speed,-angle+direction)
			ytarg = y+lengthdir_y(speed,-angle+direction)
			if !place_meeting(xtarg,ytarg,obj_obstacle)&&angle_difference(controlDir,direction)<maxAngle{
				direction = direction -angle
				free=free or 1
				break;
			}
		}
	speed*=free
#endregion