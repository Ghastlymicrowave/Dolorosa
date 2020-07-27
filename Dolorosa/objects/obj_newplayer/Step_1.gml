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
		case 0:
			//base movement
			motion_add(facing,min(acceleration,acceleration*point_distance(0,0,hinput,vinput)))
			//roll
			if(roll){
				motion_add(facing,maxspd*2)
				movestate=1
				maxspd*=2
				acceleration/=2
				stuntime=floor(maxspd/acceleration)
				break;
			}
			//backstep
			if(backstep){
				motion_add(point_direction(mouse_x,mouse_y,x,y),maxspd*2)
				movestate=2
				maxspd*=2
				stuntime=floor(maxspd/acceleration)
				break;
			}
		break;
		case 1://rolling
			stuntime--
			if(stuntime=0){
				movestate=0
				maxspd/=2
				acceleration*=2
			}
		break;
		case 2://backstepping
			stuntime--
			if(stuntime=0){
				movestate=0
				maxspd/=2
			}
		break;
	}
#endregion