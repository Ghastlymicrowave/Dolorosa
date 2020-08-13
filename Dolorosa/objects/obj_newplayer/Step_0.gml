/// @description Insert description here
// You can write your code in this editor
#region speed management


	if(((hinput=0&&vinput=0))&&speed>0)||stuntime>0{
			speed=max(0,speed-acceleration)
		}else{
			//speed=max(0,speed-acceleration/180*abs(angle_difference(direction,facing)))
		}

	speed=min(speed,maxspd)
#endregion
#region collision
	var free = 0
	var maxAngle = 45
	var controlDir = lookDir//point_direction(0,0,hinput,vinput)
	var xtarg = x+lengthdir_x(speed,direction) 
	var ytarg = y+lengthdir_y(speed,direction)
	
	var speedCheck = 0
	if (place_meeting(xtarg,ytarg,obj_obstacle)){
	speedCheck++	
	}
	
	if speed>0{speedCheck++}
	
		//player has spd > 0 
		//has to have direction changed
	
	
	
	
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
	if speed == 0 {speedCheck++}
	
	if speedCheck == 3{
		if movestate!=movestates.walk&&movestate!=movestates.donked {
			acceleration=default_acceleration
			maxspd=default_maxspd
			if attackstate!=attackstates.sheathed{//was attacking
				
				if instance_exists(currentHitbox){
					instance_destroy(currentHitbox)	
				}
				attackstate=attackstates.sheathed
				movestate=movestates.donked
				stuntime=10
				acceleration/=2
				motion_add(lookDir+180,20)
			}else if movestate == movestates.knockback{//was getting knocked back
				movestate=movestates.donked //keeps previous stuntime from knockback
			}else if movestate == movestates.roll{//was rolling
				movestate=movestates.donked
				stuntime=10
			}
			
			
		}
	}
	
	if(hinput!=0||vinput!=0){}
	var angleMax = 0
	
	switch(movestate){
	case movestates.walk: angleMax = 20; break;
	case movestates.roll: angleMax = 1; break;
	case movestates.attackHold: angleMax = 10; break;
	case movestates.attack: angleMax=5;break;
	case movestates.donked: angleMax=5;break;
	default: angleMax = 0; break;
	}
	
	if playerstate!=playerstates.inventory{
	lookDir += clamp(angle_difference(facing,lookDir)/6,-angleMax,angleMax)
	}
	while lookDir < 0 {
	lookDir += 360	
	}
	while lookDir > 360 {
	lookDir -= 360	
	}
	
	var outputDir = round(lookDir/45)
	while outputDir > 7 {
	outputDir-=8	
	}
	
	
	
	//image_angle=lookDir
	sprite_index = playersprites[outputDir]
	
	
	//image_angle=lookDir
#endregion