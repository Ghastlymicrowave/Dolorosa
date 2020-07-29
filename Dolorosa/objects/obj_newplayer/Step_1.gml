/// @description Inputs and Shit
// You can write your code in this editor
#region keyboard/mouse
	hinput=keyboard_check(ord("D"))-keyboard_check(ord("A"))
	vinput=keyboard_check(ord("S"))-keyboard_check(ord("W"))
	roll=keyboard_check_pressed(vk_space)
	backstep=keyboard_check_pressed(vk_shift)
	lightAttack=mouse_check_button_pressed(mb_left)
	heavyAttack=mouse_check_button_pressed(mb_right)
	attack = lightAttack||heavyAttack
	hold=mouse_check_button(mb_left)||mouse_check_button(mb_right)
	
	if(abs(hinput)+abs(vinput)>0){facing=point_direction(0,0,hinput,vinput); }
#endregion
#region controller
#endregion
#region set shit based on inputs
//direct movement
	switch(movestate){
		case movestates.walk:
			//base movement
			
			motion_add(facing,min(acceleration,acceleration*point_distance(0,0,hinput,vinput)))
			//roll
			if(roll){
				PlayerSetMovestate(movestates.roll,facing,default_maxspd*2,default_maxspd*2,default_acceleration/2)
				stuntime = floor(maxspd/acceleration)
				break;
			}
			//backstep
			if(backstep){
				var mousePoint = point_direction(mouse_x,mouse_y,x,y)
				PlayerSetMovestate(movestates.backstep,mousePoint,default_maxspd*2,default_maxspd*2,default_acceleration)
				stuntime = floor(maxspd/acceleration)
				break;
			}
		break;
		case movestates.roll://rolling
			stuntime--
			if(stuntime=0){
				movestate=movestates.walk
				maxspd = default_maxspd
				acceleration = default_acceleration
			}
		break;
		case movestates.backstep://backstepping
			stuntime--
			if(stuntime=0){
				movestate = movestates.walk
				maxspd = default_maxspd
			}
		break;
		case movestates.attack://attacking
			//stuntime--
			//if(stuntime=0){
			//	movestate=movestates.walk
			//	//maxspd/=2
			//	//acceleration*=2
			//}
		break;
		case movestates.attackHold://attacking
			//if attackstate !=attackstates.holding && attackstate!=attackstates.windup{
			//	//movestate = movestates.walk
			//}
			motion_add(facing,min(acceleration,acceleration*point_distance(0,0,hinput,vinput)))
		break;
	}
#endregion

#region interaction

if (playerstate==playerstates.standard&&attackstate==attackstates.sheathed){
	
}

#endregion

//!!!!!!!!!!!!!!!!!!!!!!!!!! Direction isn't locked when attacking, 


#region attacks

switch(attackstate){
case attackstates.sheathed:
	if attack_time >  0 {
	attack_time --
		if attack_time == 0 {
			attack_combo = 0
		}
	}

	if (attack&&playerstate==playerstates.standard&&attackstate==attackstates.sheathed){//initiate attack
	attackstate=attackstates.holding
	var hitboxid = attackKit[0,attack_combo+8*heavyAttack]
	var lowerToViable = 0
	while hitboxid==0{
		lowerToViable--
		hitboxid=attackKit[0,attack_combo+8*heavyAttack-lowerToViable]
	}
	attackID = attack_combo+8*heavyAttack-lowerToViable
	var hitboxobj = HitboxFromInt(hitboxid)
	if object_exists(hitboxobj){//switch to holding
		attack_hitbox = hitboxobj
		attack_time = attackKit[5,attackID]
		movestate = movestates.attackHold
		maxspd = default_maxspd/2
		}
	}
break;

case attackstates.holding:
	
	if (!hold){
		attackstate = attackstates.windup
		maxspd = default_maxspd
		
	}
break;
case attackstates.windup:
	attack_time --
	if attack_time == 0 {//windup ends
		attackstate = attackstates.hit
		attack_time = attackKit[6,attackID]
		//create hitbox
		stuntime = attack_time
		movestate = movestates.attack
		currentHitbox = instance_create_depth(x,y,0,HitboxFromInt(attackKit[0,attackID]))
		var aimDir = lookDir//round(point_direction(x,y,mouse_x,mouse_y)/30)*30
		currentHitbox.direction = aimDir
		currentHitbox.image_angle = currentHitbox.direction
		motion_add(aimDir,attackKit[9,attackID]*4)
		acceleration=default_acceleration/4
	}
break;
case attackstates.hit:
	attack_time --
	//direction = lockeddir
	if attack_time == 0 {//hit ends
		movestate = movestates.walk
		attackstate = attackstates.cooldown
		attack_time = attackKit[7,attackID]
		//destroy hitbox
		if instance_exists(currentHitbox){
			instance_destroy(currentHitbox)
		}
		acceleration=default_acceleration
	}
break;
case attackstates.cooldown:
	attack_time --
	if attack_time == 0 {//cooldown ends
		attackstate = attackstates.sheathed
		attack_time = comboTime
	}
break;
}




#endregion