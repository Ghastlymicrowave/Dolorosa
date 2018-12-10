// Get input, vinput and hinput will either be 1,0, or -1 because bools in gamemaker return a 1 or 0 insted of a actuall bool
vinput = keyboard_check(ord("S")) - keyboard_check(ord("W"))
hinput = keyboard_check(ord("D")) - keyboard_check(ord("A"))

//if any input
if (vinput!=0)||(hinput!=0){
	//gets input direction and calulates the angle difference between the input and current direction
var inputdir = point_direction(0,0,hinput,vinput)
angledif = angle_difference(direction,inputdir)
if speed = 0 {
	lastdir=inputdir
} else{
lastdir -= angledif/4 //rotates player direction twords where they want to go
}

if speed < 8 then speed ++
} else if speed > 0 then speed-= speed
direction = lastdir

