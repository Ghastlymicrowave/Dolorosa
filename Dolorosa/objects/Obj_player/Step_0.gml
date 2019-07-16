
if keyboard_check_pressed(ord("M")){
	if window_get_fullscreen(){
window_set_fullscreen(0)} else window_set_fullscreen(1)
}


//set v and h inputs
#region knockback
if(knockbacktime>=0.1){
knockbacktime--
motion_add(knockbackdir,round(knockbackmult * sin((knockbacktime*pi)/2*(1/(initalknockbacktime*2)))))
}
#endregion
#region collide enemy hitboxes
var enemyCollisionID = instance_place(x,y,obj_enemyHitbox)
if enemyCollisionID!= noone{
	
	if enemyCollisionID.mask_index!=sp_null{



if(place_meeting(x,y,enemyCollisionID)&&((iframes<=0)||(enemyCollisionID.ignoreiframes=1))){
inventoryopen=0
knockbacktime = enemyCollisionID.knockback
knockbackmult = enemyCollisionID.knockbackmult
initalknockbacktime=enemyCollisionID.initalknockbacktime
hp-=enemyCollisionID.damage
iframes=enemyCollisionID.iframes
if enemyCollisionID.knockbacktype=1{//radial burst
	knockbackdir = point_direction(x,y,enemyCollisionID.x,enemyCollisionID.y)+180
}else if enemyCollisionID.knockbacktype=0{//hitbox's direction
	knockbackdir = enemyCollisionID.dir	
}

if enemyCollisionID.multihit=0{
//instance_destroy(enemyCollisionID) multihit doesn't work with current enemy, enemy needs the hitbox to not be destroyed
enemyCollisionID.sprite_index=sp_null
}
}
}
}

#endregion
#region ENEMY PUSH BACK

if(instance_exists(prnt_enemy)){
if(place_meeting(x,y,prnt_enemy)){
	var enID = instance_place(x,y,prnt_enemy)
	speed/=2
	speed+=prnt_enemy.speed/2
	direction=point_direction(prnt_enemy.x,prnt_enemy.y,x,y)
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
