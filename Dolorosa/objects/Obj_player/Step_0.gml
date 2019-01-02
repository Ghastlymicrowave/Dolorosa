//set v and h inputs
#region knockback
if(knockbacktime>=0.1){
knockbacktime/=1.2
motion_add(knockbackdir,round(knockbacktime*knockbackmult))
}
#endregion
#region collide enemy hitboxes
if(instance_exists(obj_enemyHitbox)){
var damageID = instance_nearest(x,y,obj_enemyHitbox)
if(place_meeting(x,y,damageID)){
//subtract HP here
knockbacktime = damageID.knockback
knockbackmult = damageID.knockbackmult
knockbackdir = point_direction(x,y,damageID.x,damageID.y)+180
}
}
#endregion
#region ROTATE AND COLLISION
for (var angle = 0;angle<=70; angle += 1){
				xtarg = x+lengthdir_x(speed,angle+direction)
				ytarg = y+lengthdir_y(speed,angle+direction)
				if !place_meeting(xtarg,ytarg,obj_obstacle){
					direction = direction + angle
					//hspeed=floor(abs(hspeed))*sign(hspeed)
					//vspeed=floor(abs(vspeed))*sign(vspeed)
					break;
				}
			}
		
		for (var angle = 0;angle<=70; angle += 1){
				xtarg = x+lengthdir_x(speed,-angle+direction)
				ytarg = y+lengthdir_y(speed,-angle+direction)
				if !place_meeting(xtarg,ytarg,obj_obstacle){
					direction = direction -angle
					//hspeed=floor(abs(hspeed))*sign(hspeed)
					//vspeed=floor(abs(vspeed))*sign(vspeed)
					break;
				}
			}
			
CollisionWith(obj_obstacle)
#endregion
