// Get input, vinput and hinput will either be 1,0, or -1 because bools in gamemaker return a 1 or 0 insted of a actuall bool
vinput = keyboard_check(ord("S")) - keyboard_check(ord("W"))
hinput = keyboard_check(ord("D")) - keyboard_check(ord("A"))

if stamina=100 then staminaExaust=0
//happens once when stamina = 0

//staminatimer counts down to 0, when it hits 0 begins adding stamina until stamina reaches 100
// also staminaExaust is a bool to determine this check once
if stamina<=0&&staminaExaust=0 {
staminaExaust =1
staminaTimer=40
stamina=0
}
if staminaTimer>0 then staminaTimer-- else if stamina<100 then stamina++
if stamina>0&&keyboard_check(vk_shift)&&staminaExaust=0 { sprint=1;stamina-=1;staminaTimer=20}else sprint=0

//if any input
if (vinput!=0)||(hinput!=0){
	//gets input direction and calulates the angle difference between the input and current direction
	var inputdir = point_direction(0,0,hinput,vinput)
	angledif = angle_difference(lastdir,inputdir)
	if spd = 0 {
		lastdir=inputdir // if you're still moving it sets the lastdir to not get a dir of 0 when you're not moving
	} else{
		lastdir -= angledif/4 //rotates player direction twords where they want to go
	}
	if staminaExaust=1 {maxspd=exaustSpd}else maxspd=walkSpd
	if sprint==1{ maxspd=sprintSpd}
	if spd<maxspd then spd++ else {spd-=(spd-maxspd)/2; spd=round(spd)}
	
} else if spd > 0 then spd-= sign(spd)
speed = spd
direction = lastdir
hspeed = round(hspeed)
vspeed=round(vspeed)
//for (var angle = 0;angle<=50; angle += 1){
//				xtarg = x+lengthdir_x(spd,angle+direction)
//				ytarg = y+lengthdir_y(spd,angle+direction)
//				if !place_meeting(xtarg,ytarg,obj_obstacle){
//					direction = direction + angle
//					hspd=round(hspd)
//					vspd=round(vspd)
//					x=round(x)
//					y=round(y)
//					exit;
//				}
//			}
		
//		for (var angle = 0;angle<=50; angle += 1){
//				xtarg = x+lengthdir_x(spd,-angle+direction)
//				ytarg = y+lengthdir_y(spd,-angle+direction)
//				if !place_meeting(xtarg,ytarg,obj_obstacle){
//					direction = direction -angle
//					hspd=round(hspd)
//					vspd=round(vspd)
//					x=round(x)
//					y=round(y)
//					exit;
//				}
//			}
			
CollisionWith(obj_obstacle)