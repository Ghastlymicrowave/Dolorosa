#region don't change
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
attacking=0
atktimeheld=0
standbytime=0
delayiframes=0
drawStamina=0
drawStaminacurrent=0
healthbarframe=0
healthbarframetick=0

aimtime=200//time it takes to fully aim
aimspread=60// degrees of a shot if fired with no aiming

wielding=0 //melee, 1 is gun

staggerthresh=50

maxspd=0
atk=0

combo=0
atkwarmuptime=0
heldtoolong=0
healthbarcolor=c_white
staminabarcolor=c_white
inventoryopen=0
gamepaused=0
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


#endregion

basedodgespd=20
dir=0

//change these when you want


baseATK=10

room_speed=60
scalefactor=5//pixels in width for the stamina bar and hp bar(not implimented yet)
AtkAngleThreshhold =45// 
heavyAtkTimeThresholdHighest=40//longest time you can hold a heavy for
maxstamina=100
exaustSpd=12
walkSpd=15
sprintSpd=20
heavyAtkTimeThreshold=15//#of frames you need to hold atk before heavy atking
sprintHeldTreshold=20 //#of frames you need to hold sprint button before you go fast
keyboardAiming=0//wether you aim with mouse(0) or keyboard(1)


//right click, special ability (parry, block,)
//hold left click heavy attack
//									space roll 
//									left controll backstep


//key inputs:


