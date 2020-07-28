/// @description Inputs and Shit
// You can write your code in this editor
#region keyboard/mouse
	hinput=keyboard_check(ord("D"))-keyboard_check(ord("A"))
	vinput=keyboard_check(ord("S"))-keyboard_check(ord("W"))
	roll=keyboard_check_pressed(vk_space)
	backstep=keyboard_check_pressed(vk_shift)
	if(abs(hinput)+abs(vinput)>0){facing=point_direction(0,0,hinput,vinput)}
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
				var stun = floor(maxspd/acceleration)
				PlayerSetMovestate(movestates.roll,facing,maxspd*2,maxspd*2,acceleration/2,stun)
				break;
			}
			//backstep
			if(backstep){
				var mousePoint = point_direction(mouse_x,mouse_y,x,y)
				var stun = floor(maxspd/acceleration)
				PlayerSetMovestate(movestates.backstep,mousePoint,maxspd*2,maxspd*2,acceleration,stun)
				break;
			}
		break;
		case movestates.roll://rolling
			stuntime--
			if(stuntime=0){
				movestate=movestates.walk
				maxspd/=2
				acceleration*=2
			}
		break;
		case movestates.backstep://backstepping
			stuntime--
			if(stuntime=0){
				movestate=movestates.walk
				maxspd/=2
			}
		break;
	}
#endregion