// Get input, vinput and hinput will either be 1,0, or -1 because bools in gamemaker return a 1 or 0 insted of a actuall bool

#region INPUT
vinput = keyboard_check(ord("S")) - keyboard_check(ord("W"))
hinput = keyboard_check(ord("D")) - keyboard_check(ord("A"))
if atkwarmuptime>0 { vinput=0;hinput=0;}
if keyboard_check_pressed(ord("F"))&&atk=0&&atktimeheld=0&&standbytime=0{
wielding=!wielding	
}
#endregion
#region STAMINA run out change the bar's color
staminaFullColor = $ffffff
staminaEmptyColor = $3300ff
staminaUseColor = $666666

if staminaTimer<=0&&atkwarmuptime<=0&&atktimeheld<=0&&wielding=0 then combo=0
if stamina>=maxstamina {staminaExaust=0;stamina=maxstamina;staminabarcolor=staminaFullColor}
//happens once when stamina = 0
//staminatimer counts down to 0, when it hits 0 begins adding stamina until stamina reaches max
// also staminaExaust is a bool to determine this check once
if stamina<=0&&staminaExaust=0 {
	stamina=0
	staminaTimer=100
staminaExaust =1
staminabarcolor=staminaEmptyColor
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
switch (wielding){
	case 0:
#region melee attacks																												need to add combos and warmup frames
#region atktimeheld
if (mouse_check_button_released(mb_left)) && heldtoolong=1 then heldtoolong=0
if (dodgetime!=0||staminaExaust||gamepaused)&&atktimeheld!=-1 then atktimeheld = 0 else if mouse_check_button(mb_left)&&heldtoolong=0&&inventoryopen=0&&atktimeheld!=-1{
atktimeheld++	
ScreenshakeAmt(atktimeheld/8,atktimeheld,0,480/atktimeheld,0)
}else if atktimeheld>0&&heldtoolong=1{
	ScreenshakeAmt(atktimeheld/8,atktimeheld,0,480/atktimeheld,0)
}
if atktimeheld=-1{
if !mouse_check_button(mb_left) then atktimeheld=0	
}

#endregion
#region atkwarmup
if atkwarmuptime>0&&atk!=0{
		atkwarmuptime--
		//show_debug_message("warmup"+string(atkwarmuptime))
		if atkwarmuptime=0{
			atkID = instance_create_depth(x,y,-1,obj_PlayerAttack)	
			#region light 1
			if combo=1{// Light Attack
				ScreenshakeAmt(2,8,2,10,0)
				with(atkID){
					image_angle=obj_player.lastdir
					range=40
					duration=8
					damage=obj_player.baseATK
				}
				dodgetime=12
				initaldodgetime=12
				dodgespeed=basedodgespd
				staminaTimer=40
				stamina=stamina-15
				dodgedelay=dodgetime+5
				standbytime=20
				attackingframes = dodgetime
				sprite_index=sp_badplayeratk
			#endregion
			#region light 2
			}else if combo=2{
				
				ScreenshakeAmt(2,10,2,9,0)
				with(atkID){
					image_angle=obj_player.lastdir
					range=45
					duration=10
					damage=obj_player.baseATK
				}
				dodgetime=12
				initaldodgetime=12
				dodgespeed=basedodgespd
				staminaTimer=40
				stamina=stamina-15
				dodgedelay=dodgetime+5
				standbytime=20
				attackingframes =dodgetime
				sprite_index=sp_badplayeratk
				#endregion
				#region light 3
			}else if combo=3{
				combo=0
				ScreenshakeAmt(8,12,6,8,0)
				with(atkID){
					image_angle=obj_player.lastdir
					range=50
					duration=10
					damage=floor(obj_player.baseATK*1.20)
				}
				dodgetime=18
				initaldodgetime=18
				dodgespeed=basedodgespd*1.25
				staminaTimer=40
				stamina=stamina-15
				dodgedelay=dodgetime+5
				standbytime=20
				attackingframes = dodgetime
				sprite_index=sp_badplayeratk
				#endregion
				#region heavy 1
			}else if combo=4{
				
				ScreenshakeAmt(6,16,4,3,0)
				with(atkID){
					range=40
					duration=14
					image_yscale=1.5
					damage=floor(obj_player.baseATK*1.25)
				}
				dodgetime=16
				initaldodgetime=16
				dodgespeed=basedodgespd*1.25
				staminaTimer=50
				stamina=stamina-30
				dodgedelay=dodgetime+5
				standbytime=24
				attackingframes = dodgetime
				sprite_index=sp_badplayeratk
				#endregion
				#region heavy 2
			}else if combo=5{
				combo=0
				ScreenshakeAmt(6,16,4,3,0)
				with(atkID){
					range=40
					duration=18
					image_yscale=1.75
					damage=floor(obj_player.baseATK*1.30)
				}
				dodgetime=18
				initaldodgetime=18
				dodgespeed=basedodgespd*1.5
				staminaTimer=50
				stamina=stamina-30
				dodgedelay=dodgetime+5
				standbytime=20
				attackingframes = dodgetime
				sprite_index=sp_badplayeratk
				#endregion
			}
			atk=0
		}
	}

#region intial attacks
if stamina>0&&dodgetime=0&&staminaExaust=0&&atktimeheld>0&&atk=0&&(!mouse_check_button(mb_left)||atktimeheld>=heavyAtkTimeThresholdHighest)&&gamepaused=0{
if atktimeheld>=heavyAtkTimeThresholdHighest then heldtoolong=1
if atktimeheld < heavyAtkTimeThreshold{ // Light Attack
	
	if combo=2{
	atkwarmuptime=8
	combo=3
	}else if combo=1{
	atkwarmuptime=10
	combo=2
	}else if combo=0||combo>3{
	atkwarmuptime=10
	combo=1
	}
	atk=1
	if keyboardAiming =1 {
	lockeddir=direction} else lockeddir= point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,mouse_x,mouse_y)
	/// this bit can be commented out if it don't work, it just makes it so that you can only attack at a max of 30 degrees from your current direction		I think it's cool tho
	if spd!=0{
	if abs(angle_difference(lastdir,lockeddir))>AtkAngleThreshhold {
		lockeddir =lastdir - AtkAngleThreshhold * sign(angle_difference(lastdir,lockeddir))
	}}
} else{ //if atktimeheld>=heavyAtkTimeThreshold{    Heavy Attack
	if combo=4{
		atkwarmuptime=15
		combo=5
	}else if combo=0||combo<4{
		atkwarmuptime=20
		combo=4
	}
	atk=1
	
	if keyboardAiming =1 {
	lockeddir=direction} else lockeddir= point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,mouse_x,mouse_y)
	if spd!=0{
	if abs(angle_difference(lastdir,lockeddir))>AtkAngleThreshhold {
		lockeddir =lastdir - AtkAngleThreshhold * sign(angle_difference(lastdir,lockeddir))
	}}
}
}
#endregion
#endregion
#endregion
	break;
	
	case 1:
#region gun attacks

if mouse_check_button(mb_right){
	if atktimeheld<aimtime { 
	 atktimeheld+=floor((aimtime-atktimeheld)/4)	
	}
}else if atktimeheld>0 {
atktimeheld=floor(atktimeheld/2)	
}

aimdir=obj_camera_place.direction

#endregion
break;
}

#region BACKSTEP
if stamina>0&&keyboard_check_pressed(vk_control)&&dodgetime==0&&gamepaused=0{
	
	if staminaExaust=0{					//backstep
		dodgetime = 15
		initaldodgetime=15
		dodgespeed=basedodgespd
		standbytime=3
		delayiframes=3
		initaliframes=9
		
	}else{								//exausted backsep
		dodgetime = 18
		initaldodgetime=18
		dodgespeed=basedodgespd*.75
		standbytime=7
		delayiframes=4
		initaliframes=7
	}
	backstepping=1
	
	if atkwarmuptime>0{
		lockeddir=lockeddir+180
		stamina-=15
		dodgespeed=basedodgespd
	}else{
	if keyboardAiming =1 {
	lockeddir=direction+180} else lockeddir= 180+point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,mouse_x,mouse_y)
	}
	staminaTimer=40
	stamina-=15
	dodgedelay=30
	atk=0
	atkwarmuptime=0
	atktimeheld=0
}
#endregion
#region ROLL
if stamina>0&&keyboard_check_pressed(vk_space)&&standbytime==0&&dodgetime==0&&gamepaused=0{
	
	if staminaExaust=0{					//roll
		dodgetime = 25
		initaldodgetime=25
		dodgespeed=basedodgespd*1.5
		standbytime=5
		delayiframes=3
		initaliframes=19
	}else{								//exausted roll
		dodgetime = 30
		initaldodgetime=30
		dodgespeed=basedodgespd
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
if atkwarmuptime>0&&atk!=0{
lastdir=lockeddir
		direction=lockeddir}

if dodgetime>0{

if standbytime>0{// allows player to initiate attack while in standby
if mouse_check_button(mb_left)&&wielding=0{
{if backstepping=1 {lastdir=lastdir+180;backstepping=0}}
atktimeheld=10
}
}
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
	if atktimeheld>0 {maxspd = basedodgespd/4}
	if inventoryopen=1||gamepaused=1 {maxspd=0}
	if knockbacktime>=0.1{maxspd =3}
	if spd<maxspd then spd++ else {spd-=(spd-maxspd)/2; spd=round(spd)}
	
} else if spd > 0 then spd-= sign(spd)
} else {
	
	#region ROLL
if stamina>0&&keyboard_check_pressed(vk_space)&&dodgetime==0&&gamepaused=0{
	
	if staminaExaust=0{					//roll
		dodgetime = 25
		initaldodgetime=25
		dodgespeed=basedodgespd
		standbytime=5
		delayiframes=3
		initaliframes=19
	}else{								//exausted roll
		dodgetime = 30
		initaldodgetime=30
		dodgespeed=basedodgespd*.75
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

if inventoryopen||gamepaused then lastdir=lockeddir

if dodgetime>0{
//spd=
//motion_add(lockeddir,cos(((dodgetime-initaldodgetime)*pi)/(initaldodgetime*2))*dodgespeed+dodgespeed/10 )//a cos funct to set the speed as a smooth curve over the distance of a initaldodgetime also adding a small portion of the speed to give an extra kick
lastdir =lockeddir
//dodgetime--	
}

speed = spd 
if dodgetime>0 then speed/=2
direction = lastdir
hspeed = round(hspeed)
vspeed=round(vspeed)


if dodgetime>0{
//spd=
motion_add(lockeddir,cos(((dodgetime-initaldodgetime)*pi)/(initaldodgetime*2))*dodgespeed+dodgespeed/10 )//a cos funct to set the speed as a smooth curve over the distance of a initaldodgetime also adding a small portion of the speed to give an extra kick
//lastdir =lockeddir
dodgetime--	
}



if atk=0&&atktimeheld=0&&dodgetime=0{
	if keyboard_check_pressed(ord("I")) && inventoryopen=1 { inventoryopen=0 }
	else if keyboard_check_pressed(ord("I")) { inventoryopen=1; lockeddir=lastdir;obj_inventory.page=0}
}else inventoryopen=0


if hp!=scrollhp&&scrollhptimer=0{
scrollhp+=sign(floor(hp-scrollhp))//*max(abs(hp-scrollhp),1)
scrollhptimer=scrollhptimermax
}else if scrollhptimer>0 then scrollhptimer--




#region Saving

//Manual Autosave

	//save HP, inventory, any upgrades/tools
	ini_open("save.data")
	ini_write_real("general","hp",hp)
	ini_write_real("general","xPos",x)
	ini_write_real("general","yPos",y)
	ini_write_string("general","inventory",ds_list_write(global.inventory))
	ini_close()

//Manual Checkpoint Save

	// inventory, any upgrades/tools
	ini_open("save.data")
	ini_write_string("general","inventory",ds_list_write(global.inventory))
	ini_close()
	
#endregion
