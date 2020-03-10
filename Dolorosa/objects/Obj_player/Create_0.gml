#region don't change

display_set_gui_size(3840,2160)
lastdir=0
angledif=0
stamina = 100
staminaExaust=0
staminaTimer=0
sprint=0
spd = 0
dodgetime=0
iframes=0
dodgedelay=0
backstepping=0
atktimeheld=0
standbytime=0
delayiframes=0
drawStamina=0
drawStaminacurrent=0

aimdir=0

aimtime=100//time it takes to fully aim
aimspread=20// degrees of a shot if fired with no aiming
baseaimspread=10

wielding=0 //melee, 1 is gun

staggerthresh=20

maxspd=0
atk=0

combo=0
atkwarmuptime=0
healthbarcolor=c_white
staminabarcolor=c_white
interactState=0
//interact state 0 is unpaused
//interact state 1 is opened menu
//interact state 2 is interacing with choice menu
//interact state 3 is paused otherwise

fadeintime=0
knockbacktime = 0
attackingframes=0

scrollhptimer=0
scrollhptimermax=5
hp=100
drawhp=100
drawscrollhp=100
scrollhp=100
maxhp=100
aimrange=0
smoothAimDir=0

keyboard_set_map(vk_up,ord("W"))
keyboard_set_map(vk_down,ord("S"))
keyboard_set_map(vk_left,ord("A"))
keyboard_set_map(vk_right,ord("D"))
//																Add dash attacks, when setting atk input check for if dashing, low startup and medium everything else
//																also, attacking after rolling/backstepping??
/*Combos are as follows:  combo is set after an attack is made 
read combo value | coresponding attack
0 | regular heavy(3) or light(1)
1 |light 2nd attack(2)
2 |light 3rd attack
3 |heavy 2nd attack

3 heavy 1
4 heavy 2


*/
staminaUnexaustThresh=0.75 //a percent of stamina to unexaust at

#endregion
#region attack overhaul

attackKit[10,10]=noone
combo=0
combotime=0
attackWarm=-1
attackTick=0

#endregion
basedodgespd=20
dir=0

//change these when you want
readyAction=0
//1 is roll
//2 is backstep
room_speed=60
scalefactor=5//pixels in width for the stamina bar and hp bar(not implimented yet)
maxstamina=100
exaustSpd=12
walkSpd=15
sprintSpd=20
heavyAtkTimeThreshold=30//#of frames you need to hold atk before heavy atking
sprintHeldTreshold=20 //#of frames you need to hold sprint button before you go fast
keyboardAiming=0//wether you aim with mouse(0) or keyboard(1)
//right click, special ability (parry, block,)
//hold left click heavy attack
//space roll 
//left controll backstep


//key inputs:


