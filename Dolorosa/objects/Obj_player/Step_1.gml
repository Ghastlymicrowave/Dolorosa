// Get input, vinput and hinput will either be 1,0, or -1 because bools in gamemaker return a 1 or 0 insted of a actuall bool

#region MOVEMENT INPUT
vinput = keyboard_check(ord("S")) - keyboard_check(ord("W"))
hinput = keyboard_check(ord("D")) - keyboard_check(ord("A"))
#endregion
#region STAMINA
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
#endregion
#region SPRINT
if stamina>0&&keyboard_check(vk_shift)&&staminaExaust=0 { sprint=1;stamina-=1;staminaTimer=20}else sprint=0
#endregion
#region IFRAMES
if iframes>0 then iframes--
#endregion
#region DODGEDELAY
if dodgedelay>0 then dodgedelay--
#endregion
#region BACKSTEP
if stamina>0&&keyboard_check_pressed(vk_control)&&dodgedelay=0{
	
	if staminaExaust=0{					//backstep
		dodgetime = 10
		initaldodgetime=10
		dodgespeed=16
		iframes=20
	}else{								//exausted backsep
		dodgetime = 15
		initaldodgetime=15
		dodgespeed=12
		iframes=12
	}
	backstepping=1
	lockeddir = lastdir+180
	staminaTimer=40
	stamina=stamina-15
	dodgedelay=20
}
#endregion
#region ROLL
if stamina>0&&keyboard_check_pressed(vk_space)&&dodgedelay=0{
	
	if staminaExaust=0{					//roll
		dodgetime = 20
		initaldodgetime=20
		dodgespeed=12
		iframes=12
	}else{								//exausted roll
		dodgetime = 25
		initaldodgetime=25
		dodgespeed=8
		iframes=10
	}
	lockeddir = lastdir
	
	staminaTimer=50
	stamina=stamina-15
	dodgedelay=30

}
#endregion


if dodgetime>0{
spd=cos(((dodgetime-initaldodgetime)*pi)/(initaldodgetime*2))*dodgespeed
lastdir =lockeddir
dodgetime--
if dodgetime=0 {
	spd=0
	if backstepping=1 {lastdir=lastdir+180;backstepping=0}
}
} else{
//if any input
if (vinput!=0)||(hinput!=0){
	//gets input direction and calulates the angle difference between the input and current direction
	var inputdir = point_direction(0,0,hinput,vinput)
	angledif = angle_difference(lastdir,inputdir)
	if spd = 0 ||(abs(angledif)>150&&(vinput!=0 xor hinput!=0)){
		lastdir=inputdir // if you're still moving it sets the lastdir to not get a dir of 0 when you're not moving
	} else{
		lastdir -= angledif/4 //rotates player direction twords where they want to go
	}
	if staminaExaust=1 {maxspd=exaustSpd}else maxspd=walkSpd
	if sprint==1{ maxspd=sprintSpd}
	if spd<maxspd then spd++ else {spd-=(spd-maxspd)/2; spd=round(spd)}
	
} else if spd > 0 then spd-= sign(spd)
}
speed = spd
direction = lastdir
hspeed = round(hspeed)
vspeed=round(vspeed)




#region ROTATE AND COLLISION
for (var angle = 0;angle<=50; angle += 1){
				xtarg = x+lengthdir_x(speed,angle+direction)
				ytarg = y+lengthdir_y(speed,angle+direction)
				if !place_meeting(xtarg,ytarg,obj_obstacle){
					direction = direction + angle
					//hspeed=floor(abs(hspeed))*sign(hspeed)
					//vspeed=floor(abs(vspeed))*sign(vspeed)
					exit;
				}
			}
		
		for (var angle = 0;angle<=50; angle += 1){
				xtarg = x+lengthdir_x(speed,-angle+direction)
				ytarg = y+lengthdir_y(speed,-angle+direction)
				if !place_meeting(xtarg,ytarg,obj_obstacle){
					direction = direction -angle
					//hspeed=floor(abs(hspeed))*sign(hspeed)
					//vspeed=floor(abs(vspeed))*sign(vspeed)
					exit;
				}
			}
			
CollisionWith(obj_obstacle)
#endregion