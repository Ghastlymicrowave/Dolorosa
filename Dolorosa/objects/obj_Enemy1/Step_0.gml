/// @description Insert description here
// You can write your code in this editor
#region Initialize States
stateAI = baseStateAI
if(/*PLAYER DETECTION CONDITION GOES HERE*/ !collision_line(x,y,obj_player.x,obj_player.y,obj_obstacle,true,true)&&distance_to_object(obj_player)<500){
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
if(distance_to_object(obj_player)<=/*ATTACK RANGE GOES HERE*/atkRange){
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

if atkcooldown = -1 {switch (attack){ //irandom(3)
	
case 0: //lunge - long warmup but big distance
atkwarmuptime = 25;
atktime = 15;
initalspd = 20;
hitbox=1
warmupspd=0;
atkcooldown=30;
break;

case 1: // heavy aoe - long warmup
atkwarmuptime=30;
atktime=20;
initalspd=4;
hitbox=1;
warmupspd=0;
atkcooldown=30;
break;

case 2: // slash -  short warmup small hitbox
atkwarmuptime=15;
atktime=8;
initalspd=5;
hitbox=1;
warmupspd=0;
atkcooldown=30;
break;
	
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
	dir= point_direction(x,y,obj_player.x,obj_player.y) //set direction CHANGE LATER TO BE SMOOTHER !!!!
	}else{
		
		if atktime!=0{// count down atktime THIS IS THE ATTACK
			
		
		spd=sin((atktime*(pi/2))/initalatktime)*initalspd
		
		if Hitbox.mask_index=sp_null && hitbox!=0{
			initalatktime=atktime
			switch(hitbox){
			case 1:
			Hitbox.mask_index=sp_circle
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
				Hitbox.mask_index=sp_null
			}	
		}
	}
	
	
	
}

#endregion

direction=dir
	speed=spd

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