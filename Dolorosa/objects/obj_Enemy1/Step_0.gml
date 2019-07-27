/// @description Insert description here
// You can write your code in this editor

if obj_player.gamepaused=0{



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
atkwarmuptime = 65;
atktime = 15;
initalspd = walkspd*6;
hitbox=1
warmupspd=0;
atkcooldown=30;
break;

case 1: // heavy aoe - long warmup
atkwarmuptime=45;
atktime=22;
initalspd=walkspd*1.5;
hitbox=1;
warmupspd=0;
atkcooldown=30;
break;

case 2: // slash -  short warmup small hitbox
atkwarmuptime=30;
atktime=10;
initalspd=walkspd*3;
hitbox=1;
warmupspd=0;
atkcooldown=30;
break;
	
						//}
}
	#endregion
	}else atkRandomizeTime--
	
	var expectedRange = 2*initalatktime*initalspd/pi +(192/2)
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
		
		dir -= angle_difference(dir,point_direction(x,y,obj_player.x,obj_player.y))/15 //rotates enemy to face player but slowly
		
		
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
			atkRandomizeTime=0
			if (irandom(3)!=3){
				AIstate=7
			//	show_debug_message("YEEET")
				repositionTime=360
			} else AIstate=1 //chance to keep attacking or to reposition (7)
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
		
		atkRandomizeTime=0
	}
	break;
	#endregion
	
	#region Return to wandering area
	case 4: 
	
	break;
	#endregion
	
	#region Stunned
	case 5: 
			
	break;
	#endregion
	
	#region Staggered
	case 6: 
		if stunnedTime>0{
				if spd>0{
					spd--	
				}
				stunnedTime--
				if stunnedTime=0{
				AIstate=1
				break;
				}
			}
	break;
	#endregion
	
	#region Repositioning
	case 7: 
			if repositionTime>0{
			repositionTime--
			dir = point_direction(obj_player.x,obj_player.y,x,y)
			spd=walkspd*1.25
			if distance_to_object(obj_player)>600 then AIstate=1
			}else if repositionTime<=0 then AIstate=1
	break;
	#endregion
	
	#region dead
	case 8: 
	spd=0
	dir=0
	break;
	#endregion
}


Hitbox.x = cos(dir*pi/180)*min(distance_to_object(obj_player),sprite_width) + x
		Hitbox.y = -sin(dir*pi/180)*min(distance_to_object(obj_player),sprite_height)+ y
		Hitbox.image_angle = dir
		Hitbox.dir = dir
speed=spd
direction=dir

#region knockback
if(knockbacktime>=0.1){
	speed=0
	initalknockbacktime++
knockbacktime--
motion_add(knockbackdir,round(knockbackmult * sin((knockbacktime*pi)/2*(1/(initalknockbacktime*2)))))
}
#endregion

//show_debug_message(string(x)+" "+string(y)+" speed and dir:"+string(speed)+string(spd)+" "+string(direction)+string(dir))

if place_meeting(x,y,obj_PlayerAttack)&&iframes<=0{
	var playerAtkID=instance_place(x,y,obj_PlayerAttack)
	iframes = playerAtkID.duration+5
	
	//AIstate=5
	//stunnedTime=10
	//atkwarmuptime=0
	//atktime=0
	//atkcooldown=0
	hp-=playerAtkID.damage
	stagger+=floor(playerAtkID.damage/2)
	staggertimer=40
	if stagger>staggerthresh{
	AIstate=6	
	stunnedTime=60
	}

	knockbacktime = playerAtkID.knockback
knockbackmult = playerAtkID.knockbackmult
initalknockbacktime=playerAtkID.initalknockbacktime
iframes=playerAtkID.iframes
if playerAtkID.knockbacktype=1{//radial burst
	knockbackdir = point_direction(x,y,playerAtkID.x,playerAtkID.y)+180
}else if playerAtkID.knockbacktype=0{//hitbox's direction
	knockbackdir = playerAtkID.dir	
}
	
	
		Hitbox.sprite_index=sp_arrow
		Hitbox.mask_index=sp_null
			
		atkRandomizeTime=0
		if hp<=0&&AIstate!=8 { AIstate=8	//DIES
		ds_list_add(enemyinfo.deaths,"obj_Enemy1")	
		show_debug_message("FAT")
		}//Make a kill me script to make particles or something
		//if obj_questData.colletingQuests[0]!=0{ // check if this is the first time to fill this out
		//	obj_questData.colletingQuests[0]++
		//}else obj_questData.colletingQuests[0]=1
		
	//show_debug_message(string(hp))
}

if iframes>0{
iframes--	
}


if stagger!=0{

if staggertimer!=0{
staggertimer--	
}else{
	
stagger--	
}

}



} else {
speed=0

}

if(place_meeting(x,y,obj_player)){
	
	//speed+=obj_player.speed
	motion_add(point_direction(obj_player.x,obj_player.y,x,y),obj_player.speed)
	obj_player.speed/=2
	//direction=point_direction(obj_player.x,obj_player.y,x,y)
	}

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
			

#endregion
*/
#endregion
CollisionWith(obj_obstacle)