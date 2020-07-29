/// @description Insert description here
// You can write your code in this editor
room_speed=60
#region default input vars
	//to-do: Entire thing
#endregion 
#region movement/physics
	maxspd=10
	acceleration=0.2*maxspd
	movestate=0
	stuntime=0
	facing=0
	
	default_maxspd = maxspd
	default_acceleration = acceleration
	lookDir = 0
	
	
#endregion

enum movestates{
walk,
roll,
backstep,
knockback,
attack,
attackHold
}

enum playerstates{
standard,
inventory,
text,
pause,

}

enum attackstates{
sheathed,
holding,
windup,
hit,
cooldown
	
}

movestate = movestates.walk
playerstate = playerstates.standard
attackstate = attackstates.sheathed

attack_time = 0
attack_combo = 0
comboTime = 40


//attack_windupTime = 0
//attack_hitTime = 0
//attack_cooldownTime = 0
attackID = 0
attack_hitbox = 0
 
var csvImport = load_csv("attacks.csv")
attackKit[0,0]=0
//convert strings to ints
for (var i1=0; i1<ds_grid_width(csvImport); i1++){
	for (var i2=0; i2<ds_grid_height(csvImport); i2++){
		var tempstr = csvImport[# i1, i2]
		if tempstr != noone{
		attackKit[i1,i2]=real(csvImport[# i1,i2])
		} else {attackKit[i1,i2]=-4}
	}
}