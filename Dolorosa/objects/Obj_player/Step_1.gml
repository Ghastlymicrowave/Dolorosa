// Get input, vinput and hinput will either be 1,0, or -1 because bools in gamemaker return a 1 or 0 insted of a actuall bool

#region INPUT
vinput = keyboard_check(ord("S")) - keyboard_check(ord("W"))
hinput = keyboard_check(ord("D")) - keyboard_check(ord("A"))
if atkwarmuptime>0 { vinput=0;hinput=0;}
if keyboard_check_pressed(ord("F"))&&atk=0&&atktimeheld=0&&standbytime=0{
wielding=!wielding	//wielding is the weapon you are using, currently only gun or sword
}
#endregion
#region STAMINA run out change the bar's color
staminaFullColor = $ffffff
staminaEmptyColor = $3300ff
staminaUseColor = $666666

if stamina/maxstamina>=staminaUnexaustThresh {staminaExaust=0;staminabarcolor=staminaFullColor}
if stamina>=maxstamina {stamina=maxstamina}
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
#region ITEMS
	items_activate()
	items_timer_update()
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
#region ATTACKS
	#region ATTACK ITSELF
//Initiate attack
if(mouse_check_button_pressed(mb_left)&&attackPhase=0&&interactState==0){
	attackTick=1
	attackTimer=0
	attackPhase=1
	if attackKit[5,combo+atktype*8]==-4||combo=8{
	combo=0	
	}
}
//Attack Tick
attackTimer+=attackTick

/*attackPhase
0-Not attacking
1-warmup
2-active
3-"stunned" cooldown
4-moving cooldown
*/
//Hold Timer
//show_debug_message(string(attackPhase)+":"+string(attackTimer))

if(mouse_check_button(mb_left))&&attackPhase==1{
	
	
attackTimer=min(attackKit[5,combo+atktype*8]-1,attackTimer)
}
//Release timer
//show_debug_message(attackKit[5,combo+atktype*8]==attackTimer)
///light
var relA = attackKit[5,combo+atktype*8]
var relB = attackKit[6,combo+atktype*8]+relA
var relC = attackKit[7,combo+atktype*8]+relB
var relD = attackKit[8,combo+atktype*8]+relC
/*show_debug_message("releases")
show_debug_message("A:"+string(relA))
show_debug_message("B:"+string(relB))
show_debug_message("C:"+string(relC))
show_debug_message("D:"+string(relD))*/
if relA == 0 {show_message(combo)}
//if(!mouse_check_button(mb_left)){
	switch(attackTimer){
		case relA:
			attackPhase=2
			currentHitbox = instance_create_depth(x,y,0,HitboxFromInt(attackKit[0,combo+atktype*8]))
			//spawn the hitbox
		break;
		case relB:
			attackPhase=3
		break;
		case relC:
			attackPhase=4
			if instance_exists(currentHitbox){
			instance_destroy(currentHitbox)}
		break;
		case relD:
			if(attackPhase != 0){
				attackPhase=0
				attackTick=0
				attackTimer=0
				combo++
				comboTimer=30
			}
		break;
	}

//}
	#endregion
	#region COMBO TRACKING
	if(attackPhase=0){
		if(comboTimer>0){comboTimer--
		}else{combo=0}
	}
	#endregion
#endregion
#region BACKSTEP
if stamina>0&&readyAction==2&&dodgetime==0&&interactState=0{
	readyAction=0
	if staminaExaust=0{					//backstep
		dodgetime = 20
		initaldodgetime=20
		dodgespeed=basedodgespd*1.5
		standbytime=3
		delayiframes=3
		initaliframes=9
		
	}else{								//exausted backsep
		dodgetime = 23
		initaldodgetime=23
		dodgespeed=basedodgespd
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
if keyboard_check_pressed(vk_space)&&stamina>0&&interactState=0{

readyAction=1
}

if stamina>0&&readyAction==1&&dodgetime==0&&interactState=0&&atkwarmuptime=0{
	readyAction=0
	if staminaExaust=0{					//roll
		dodgetime = 25
		initaldodgetime=25
		dodgespeed=basedodgespd*1.75
		standbytime=5
		delayiframes=3
		initaliframes=19
	}else{								//exausted roll
		dodgetime = 30
		initaldodgetime=30
		dodgespeed=basedodgespd*1.5
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


//if stamina>0&&dodgetime=0&&staminaExaust=0&&atktimeheld>0&&atk=0&&(!mouse_check_button(mb_left)||atktimeheld>=heavyAtkTimeThresholdHighest)&&gamepaused=0{

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if standbytime>0||dodgetime>0{// allows player to initiate attack while in standby
if mouse_check_button_pressed(mb_left)&&wielding=0{
{if backstepping=1 {lastdir=lastdir+180;backstepping=0}}
//if mouse_check_button_pressed(mb_left)&&!staminaExaust&&!gamepaused&&atktimeheld=-1{atktimeheld=0}//first click

}
}

if dodgetime>0{
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
	if atktimeheld>0&&wielding=0 {maxspd = basedodgespd/4}
	else if atktimeheld>0&&wielding=1 {
		maxspd= clamp(basedodgespd*(aimtime-atktimeheld)/aimtime,basedodgespd/4,floor(walkSpd*.75))	}
	if interactState!=0 {maxspd=0}
	if knockbacktime>=0.1{maxspd =min(knockbacktime,basedodgespd/2)}
	if spd<maxspd then spd++ else {spd-=(spd-maxspd)/2; spd=round(spd)}
	
} else if spd > 0 then spd-= sign(spd)
} else {
	


	
standbytime--	
	lastdir=lockeddir
	spd=0
	if standbytime=0{if backstepping=1 {lastdir=lastdir+180;backstepping=0}}
}

if interactState!=0 then lastdir=lockeddir

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



#region attack movement
if attackPhase>=2&&attackPhase<4{
//a cos funct to set the speed as a smooth curve over the distance of a initaldodgetime also adding a small portion of the speed to give an extra kick
var atkMoveDuration = attackKit[6,combo+atktype*8] + attackKit[7,combo+atktype*8]
var atkMoveSpeed = attackKit[9,combo+atktype*8]
var atkTimer = attackTimer-attackKit[5,combo+atktype*8]
motion_add(lockeddir,cos(((atkTimer-atkMoveDuration)*pi)/(atkMoveDuration*2))*atkMoveSpeed)
}
#endregion


if dodgetime>0{
//spd=
motion_add(lockeddir,cos(((dodgetime-initaldodgetime)*pi)/(initaldodgetime*2))*dodgespeed+dodgespeed/10 )//a cos funct to set the speed as a smooth curve over the distance of a initaldodgetime also adding a small portion of the speed to give an extra kick
//lastdir =lockeddir
dodgetime--	
}



if atk=0&&atktimeheld=0&&dodgetime=0{
	if keyboard_check_pressed(ord("I")) && interactState=1 { interactState=0 }
	else if interactState==0&&keyboard_check_pressed(ord("I")) { interactState=1; lockeddir=lastdir;obj_inventory.page=0}
}else interactState=0


if hp!=scrollhp&&scrollhptimer=0{
scrollhp+=sign(floor(hp-scrollhp))//*max(abs(hp-scrollhp),1)
scrollhptimer=scrollhptimermax
}else if scrollhptimer>0 then scrollhptimer--


#region saving, currently unused
/*


//Manual Autosave

if keyboard_check_pressed(ord("T")){

	//save HP, inventory, any upgrades/tools
	ini_open("save.data")
	ini_write_real("general","hp",hp)
	ini_write_real("general","xPos",x)
	ini_write_real("general","yPos",y)
	ini_write_real("general","room",room)
	ini_write_string("general","inventory",ds_list_write(global.inventory))
	ini_close()
}
//Manual Checkpoint Save
if keyboard_check_pressed(ord("O")){
	// inventory, any upgrades/tools
	ini_open("save.data")
	ini_write_string("general","inventory",ds_list_write(global.inventory))
	ini_close()
} 

// Manual load checkpoint
if keyboard_check_pressed(ord("P")){
ini_open("save.data")
x= ini_read_real("general","xPos",0)
y = ini_read_real("general","yPos",0)
room = ini_read_real("general","room",room)
obj_camera_follow.x=x
obj_camera_follow.y=y
ini_close()
}

//Manual load game
if keyboard_check_pressed(ord("Y")){
ini_open("save.data")
x= ini_read_real("general","xPos",0)
y = ini_read_real("general","yPos",0)
room = ini_read_real("general","room",room)
obj_camera_follow.x=x
obj_camera_follow.y=y
ds_list_read(global.inventory,ini_read_string("general","inventory",""))
ini_close()
}
*/
#endregion


