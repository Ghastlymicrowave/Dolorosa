///@function PlayerAttack( range, duration, damage, dodgetime, dodgespeed, staminaTimer, stamina usage, standby time, sprite)
///@description do thing
///@arg range
///@arg duration
///@arg damage
///@arg dodgetime
///@arg dodgespeed
///@arg staminaTimer
///@arg stamina-=stamina use
///@arg standby
///@arg sprite index
function PlayerAttack(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {

	with(atkID){
						image_angle=obj_player.lastdir
						range=argument0
						duration=argument1
						damage=argument2
	}
					dodgetime=argument3
					initaldodgetime=argument3
					dodgespeed=argument4
					staminaTimer=argument5
					stamina=stamina-argument6
					dodgedelay=dodgetime+5
					standbytime=argument7
					attackingframes = dodgetime
					sprite_index=argument8


}
