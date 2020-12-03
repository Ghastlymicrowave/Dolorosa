/// @description Insert description here
// You can write your code in this editor
#region Inputs
dinput=point_direction(x,y,target.x,target.y)

#endregion

#region Process
switch(attack){
case 0:
	if(distance_to_object(target)>250){ // dash
		direction=dinput
		movestate=1
		attack=1
		speed=30
		cooldown=60
	}
	if(distance_to_object(target)<160){ // bite
		cooldown=90
		attack=2
	}
break;
case 1:
	cooldown--
	attack-=(cooldown<=0)
break;
case 2:
	cooldown--
	if(cooldown=30){
		with(head){
		motion_add(point_direction(x,y,mouse_x,mouse_y),40)
		}
	}
	attack+=(cooldown<=0) // transition into spin
	cooldown+=(cooldown<=0)*200
break;
case 3:// the spin attack
	cooldown--
	attack-=(cooldown<=0)*3
	with(head){ //swing
	motion_add(dinput+90,2.05)//2 is even, more goes outward
	}
break;
}
if(mouse_check_button(mb_right)){
	with(head){
	motion_add(dinput+90,2)
	}
}
if(mouse_check_button_pressed(mb_middle)){
	
}
switch(movestate){
	case 0:
		if(distance_to_object(target)>100){
			motion_add(dinput,0.11)
			speed=min(5,speed)
		}else{
			speed/=1.5
		}
	break;
	case 1:
		speed--
		speed=min(100,speed)
		if(speed<=0){movestate=0}
	break;
}
#endregion