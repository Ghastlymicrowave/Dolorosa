/// @description Insert description here
// You can write your code in this editor




switch(AIstate){
	#region Wander
	case 0: 
	
	if distance_to_object(obj_player)<=sightRange&&!collision_line(x,y,obj_player.x,obj_player.y,obj_obstacle,1,1){
		AIstate=1
		atkRandomizeTime=0
		break;
	}
	
	break;
	#endregion
	
	#region pathfind to player
	case 1: 
	
	//bad pathfinding right here:
	dir=point_direction(x,y,obj_player.x,obj_player.y)
	spd=10
	
	if collision_line(x,y,obj_player.x,obj_player.y,obj_obstacle,1,1){
		AIstate=3
		break;
	}else{
		lastknownX=obj_player.x
		lastknownY=obj_player.y
	}
	
	
	if atkRandomizeTime=0{
		attack=irandom(2)
		atkRandomizeTime=maxAtkRandomizeTime
	#region attacks
	switch (attack){ //irandom(3)
	
case 0: //lunge - long warmup but big distance
atkwarmuptime = 45;
atktime = 15;
initalspd = walkspd*5;
hitbox=1
warmupspd=0;
atkcooldown=30;
break;

case 1: // heavy aoe - long warmup
atkwarmuptime=40;
atktime=20;
initalspd=walkspd*1.25;
hitbox=1;
warmupspd=0;
atkcooldown=30;
break;

case 2: // slash -  short warmup small hitbox
atkwarmuptime=20;
atktime=8;
initalspd=walkspd*1.25;
hitbox=1;
warmupspd=0;
atkcooldown=30;
break;
	
						//}
}
	#endregion
	}else atkRandomizeTime--
	
	var expectedRange = 2*initalatktime*initalspd/pi
	if expectedRange>= distance_to_object(obj_player){
	AIstate=2	
	}
	
	// every 30 frames or so choose a new random attack
	// if player is in range of random attack, do attack, otherwise pathfind
	break;
	#endregion
	
	#region actually attacking
	case 2: 
	
	if atkwarmuptime>0{
		atkwarmuptime--
		if spd>0{spd*=.95} else spd=0
		dir= point_direction(x,y,obj_player.x,obj_player.y) //make smoother later
	}else if atktime>0{
		
		spd=sin((atktime*(pi/2))/initalatktime)*initalspd
		if !(spd>=0){
		spd=0	
		}
		
		if Hitbox.mask_index=sp_null && hitbox!=0{
			initalatktime=atktime
			switch(hitbox){
			case 1:
			Hitbox.sprite_index=sp_badCircle
			Hitbox.mask_index=sp_badCircle
			
			}
		}
		
		
		atktime--
		
		
		
		
	}else if atkcooldown>0{
		
				if spd>0 then spd--
				if spd <0 then spd =0
		
		atkcooldown--
		
		
	}
	
	if atkcooldown=0 {
			Hitbox.sprite_index=sp_arrow
			Hitbox.mask_index=sp_null
			AIstate=1	
			atkRandomizeTime=0
			break;
		
		}
	
		//warmup
		//atk
		//cooldown
		
		
	if !collision_line(x,y,obj_player.x,obj_player.y,obj_obstacle,1,1){
		lastknownX=obj_player.x
		lastknownY=obj_player.y
	}
		
	break;
	
	#endregion
	
	#region lost line of sight, search for player
	case 3:  
	//pathfind to last known x and last known y
	if !collision_line(x,y,obj_player.x,obj_player.y,obj_obstacle,1,1){
		AIstate=1
		atkRandomizeTime=0
	}
	break;
	#endregion
	
	#region Return to wandering area
	case 4: 
	
	break;
	#endregion
	
}


Hitbox.x = cos(dir*pi/180)*min(distance_to_object(obj_player),sprite_width) + x
		Hitbox.y = -sin(dir*pi/180)*min(distance_to_object(obj_player),sprite_height)+ y
		Hitbox.image_angle = dir
		Hitbox.dir = dir
speed=spd
direction=dir

show_debug_message(string(x)+" "+string(y)+" speed and dir:"+string(speed)+string(spd)+" "+string(direction)+string(dir))

#region oldcode
/*

#region Initialize States
stateAI = baseStateAI
if(//PLAYER DETECTION CONDITION GOES HERE/ 
!collision_line(x,y,obj_player.x,obj_player.y,obj_obstacle,true,true)&&distance_to_object(obj_player)<500){
baseStateAI = 1
}

switch (attack){
case 0:
atkRange=200
case 1:
atkRange =100
case 2:
atkRange =100
break;
}
if(distance_to_object(obj_player)<=atkRange){//ATTACK RANGE GOES HERE
stateAI++
}
#endregion
#region Execute States
switch(stateAI){
case 0:

//IDLE/WALKING CODE GOES HERE

//IDLE/WALKING CODE GOES HERE

break;
case 1:

//PATHFIND CODE GOES HERE
if atkwarmuptime = -1{
dir=point_direction(x,y,obj_player.x,obj_player.y)
spd=10
if point_distance(x,y,obj_player.x,obj_player.y) < 50 then spd =0
}
//PATHFIND CODE GOES HERE

break;
case 2:

//ATTACKING CODE GOES HERE

// SELECT ATTACK AND SET BASE ATTACK VARIABLES
// WHENN WARMUP RUNS OUT DO ATTACK WITH A COOLDOWN

if atkcooldown = -1 {
	
}
if stalltime>0 { stalltime--
	}
if stalltime=0{
			
			
			//var cycles=0
				//while (-1*(-1*(2*initalatktime*initalspd*cos(pi/2)/pi)+initalspd)+Hitbox.sprite_width<distance_to_object(obj_player)){
				//	cycles++
				//if cycles=4 {
				//	stalltime=20
				//	atkwarmuptime=-1
				//	atkcooldown=-1
				//	atktime=0
				//	break;
				//}


//sin((atktime*(pi/2))/initalatktime)*initalspd
// sin((x*pi/2)/(a))*c
//c is spd    a is atktime
//var expectedRange = initalspd*sin((atktime*pi)/2*initalatktime)
//var expectedRage = 
//subsitute x for inital time
	
	
	
	switch (attack){ //irandom(3)
	
case 0: //lunge - long warmup but big distance
atkwarmuptime = 45;
atktime = 15;
initalspd = 22;
hitbox=1
warmupspd=0;
atkcooldown=30;
break;

case 1: // heavy aoe - long warmup
atkwarmuptime=40;
atktime=20;
initalspd=4;
hitbox=1;
warmupspd=0;
atkcooldown=30;
break;

case 2: // slash -  short warmup small hitbox
atkwarmuptime=20;
atktime=8;
initalspd=10;
hitbox=1;
warmupspd=0;
atkcooldown=30;
break;
	
						//}
}
}
tick++
	switch(tick){
	case 360:
	tick = 0
	break;
	}
//ATTACKING CODE GOES HERE

break;
}
#endregion
#region Attacking

if atkwarmuptime!=-1 { //check if an attack is active (counting down, 0, or inactive)
	
	
	if atkwarmuptime!=0 { //count down warmup
	atkwarmuptime--	;
	if atkwarmuptime>0&&spd>0{spd*=.95} else spd=0
	dir= point_direction(x,y,obj_player.x,obj_player.y) //set direction CHANGE LATER TO BE SMOOTHER !!!!
	}else{
		
		if atktime!=0{// count down atktime THIS IS THE ATTACK
			
		
		spd=sin((atktime*(pi/2))/initalatktime)*initalspd
		
		if Hitbox.mask_index=sp_null && hitbox!=0{
			initalatktime=atktime
			switch(hitbox){
			case 1:
			Hitbox.sprite_index=sp_badCircle
			Hitbox.mask_index=sp_badCircle
			
			}
		}
		
		atktime--;
		} else{
			
			if atkcooldown!=0{
				atkcooldown--
				if spd>0 then spd--
				if spd <0 then spd =0
			}else{// RESET VARIABLE(S) FOR NEXT ATTACK
				//change random attack
				attack= irandom(2)
				atkwarmuptime=-1
				atkcooldown=-1
				Hitbox.sprite_index=sp_arrow
				Hitbox.mask_index=sp_null
				stalltime=20
			}	
		}
	}
	
	
	
} else{
Hitbox.sprite_index= sp_null
}

#endregion

direction=dir
	speed=spd

Hitbox.x = cos(dir*pi/180)*min(distance_to_object(obj_player),sprite_width) + x
Hitbox.y = -sin(dir*pi/180)*min(distance_to_object(obj_player),sprite_height)+ y
Hitbox.image_angle = dir
Hitbox.dir = dir

//integral of the function of startingspd+ x * drop off speed thing


// -1*cos
#region ROTATE AND COLLISION
for (var angle = 0;angle<=70; angle += 1){
				xtarg = x+lengthdir_x(speed,angle+direction)
				ytarg = y+lengthdir_y(speed,angle+direction)
				if !place_meeting(xtarg,ytarg,obj_obstacle){
					direction = direction + angle
					break;
				}
			}
		
		for (var angle = 0;angle<=70; angle += 1){
				xtarg = x+lengthdir_x(speed,-angle+direction)
				ytarg = y+lengthdir_y(speed,-angle+direction)
				if !place_meeting(xtarg,ytarg,obj_obstacle){
					direction = direction -angle
					break;
				}
			}
			
CollisionWith(obj_obstacle)
#endregion
*/
#endregion
