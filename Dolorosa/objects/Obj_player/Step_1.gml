// Get input, vinput and hinput will either be 1,0, or -1 because bools in gamemaker return a 1 or 0 insted of a actuall bool

#region MOVEMENT INPUT
vinput = keyboard_check(ord("S")) - keyboard_check(ord("W"))
hinput = keyboard_check(ord("D")) - keyboard_check(ord("A"))
#endregion
#region STAMINA
if stamina>=maxstamina {staminaExaust=0;stamina=maxstamina}
//happens once when stamina = 0
//staminatimer counts down to 0, when it hits 0 begins adding stamina until stamina reaches max
// also staminaExaust is a bool to determine this check once
if stamina<=0&&staminaExaust=0 {
	stamina-=20
staminaExaust =1
staminaTimer=40
}
if staminaTimer>0 then staminaTimer-- else if stamina<maxstamina { stamina+=0.5} 
#endregion
#region SPRINT
if stamina>0&&keyboard_check(vk_shift)&&staminaExaust=0&&spd>=walkSpd { sprintheld++}else {sprint=0;sprintheld=0}
if sprintheld>=sprintHeldTreshold{sprint=1;stamina-=0.5;staminaTimer=20}
#endregion
#region IFRAMES
if delayiframes >0 { delayiframes--; if delayiframes=0 then iframes=initaliframes }else{
if iframes>0 then iframes--}
#endregion
#region DODGEDELAY
if dodgedelay>0 then dodgedelay--
#endregion

#region attacks																												need to add combos and warmup frames
if dodgetime!=0 then atktimeheld = 0 else if mouse_check_button(mb_left){
atktimeheld++	
}

if stamina>0&&dodgetime=0&&staminaExaust=0&&atktimeheld>0&&mouse_check_button_released(mb_left){
	
atkID = instance_create_depth(x,y,-1,obj_PlayerAttack)	
if atktimeheld < heavyAtkTimeThreshold{ // Light Attack
	ScreenshakeAmt(2,8,2,10)
	with(atkID){
	image_angle=direction
	range=40
	duration=8
	}
	if keyboardAiming =1 {
	lockeddir=direction} else lockeddir= point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,mouse_x,mouse_y)
	dodgetime=12
	initaldodgetime=12
	dodgespeed=4
	staminaTimer=40
	stamina=stamina-15
	dodgedelay=dodgetime+5
	standbytime=20
	
} else{
ScreenshakeAmt(4,16,2,4)
with(atkID){
	range=40
	duration=14
	image_yscale=1.5
	}
	if keyboardAiming =1 {
	lockeddir=direction} else lockeddir= point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,mouse_x,mouse_y)
	dodgetime=16
	initaldodgetime=16
	dodgespeed=8
	staminaTimer=50
	stamina=stamina-30
	dodgedelay=dodgetime+5
	standbytime=24

}
}
#endregion

#region BACKSTEP
if stamina>0&&keyboard_check_pressed(vk_control)&&dodgetime==0{
	
	if staminaExaust=0{					//backstep
		dodgetime = 15
		initaldodgetime=15
		dodgespeed=10
		standbytime=3
		delayiframes=3
		initaliframes=9
		
	}else{								//exausted backsep
		dodgetime = 18
		initaldodgetime=18
		dodgespeed=8
		standbytime=7
		delayiframes=4
		initaliframes=7
	}
	backstepping=1
	if keyboardAiming =1 {
	lockeddir=direction+180} else lockeddir= 180+point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,mouse_x,mouse_y)
	staminaTimer=40
	stamina=stamina-15
	dodgedelay=30
}
#endregion
#region ROLL
if stamina>0&&keyboard_check_pressed(vk_space)&&standbytime==0&&dodgetime==0{
	
	if staminaExaust=0{					//roll
		dodgetime = 25
		initaldodgetime=25
		dodgespeed=15
		standbytime=5
		delayiframes=3
		initaliframes=19
	}else{								//exausted roll
		dodgetime = 30
		initaldodgetime=30
		dodgespeed=12
		standbytime=5
		initaliframes=15
	}
	lockeddir = lastdir
	
	staminaTimer=50
	stamina=stamina-15
	dodgedelay=40

}
#endregion


//first while dodgetime is running out, the player is locked in a direction with their speed dictacted by dodgetime, dodgespeed, and initaldodgetime
//next standbytime counds down, during this the player cannot move

if dodgetime>0{
spd=cos(((dodgetime-initaldodgetime)*pi)/(initaldodgetime*2))*dodgespeed+dodgespeed/10 //a cos funct to set the speed as a smooth curve over the distance of a initaldodgetime also adding a small portion of the speed to give an extra kick
lastdir =lockeddir
dodgetime--

} else if standbytime<=0{
	
//if any input
if (vinput!=0)||(hinput!=0){
	//gets input direction and calulates the angle difference between the input and current direction
	var inputdir = point_direction(0,0,hinput,vinput)
	angledif = angle_difference(lastdir,inputdir)
	if spd = 0 ||(abs(angledif)>150&&(vinput!=0 xor hinput!=0)){
		lastdir=inputdir // if you're still moving it sets the lastdir to not get a dir of 0 when you're not moving
	} else{
		if maxspd<walkSpd{
		lastdir -= angledif/5*(spd/walkSpd)} //rotates player direction twords where they want to go
		else{lastdir-=angledif/5*(spd/maxspd)}
	}
	if staminaExaust==1 {maxspd=exaustSpd} else {maxspd=walkSpd}
	if sprint==1{ maxspd=sprintSpd}
	if atktimeheld>0 {maxspd = 3}
	if spd<maxspd then spd++ else {spd-=(spd-maxspd)/2; spd=round(spd)}
	
} else if spd > 0 then spd-= sign(spd)
} else {
	
	#region ROLL
if stamina>0&&keyboard_check_pressed(vk_space)&&dodgetime==0{
	
	if staminaExaust=0{					//roll
		dodgetime = 25
		initaldodgetime=25
		dodgespeed=15
		standbytime=5
		delayiframes=3
		initaliframes=19
	}else{								//exausted roll
		dodgetime = 30
		initaldodgetime=30
		dodgespeed=12
		standbytime=5
		initaliframes=15
	}
	lockeddir = lastdir
	
	staminaTimer=50
	stamina=stamina-15
	dodgedelay=40

}
#endregion

	
standbytime--	
	lastdir=lockeddir
	spd=0
	if standbytime=0{if backstepping=1 {lastdir=lastdir+180;backstepping=0}}
}
speed = spd
direction = lastdir
hspeed = round(hspeed)
vspeed=round(vspeed)




#region ROTATE AND COLLISION
for (var angle = 0;angle<=70; angle += 1){
				xtarg = x+lengthdir_x(speed,angle+direction)
				ytarg = y+lengthdir_y(speed,angle+direction)
				if !place_meeting(xtarg,ytarg,obj_obstacle){
					direction = direction + angle
					//hspeed=floor(abs(hspeed))*sign(hspeed)
					//vspeed=floor(abs(vspeed))*sign(vspeed)
					exit;
				}
			}
		
		for (var angle = 0;angle<=70; angle += 1){
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