/// @description Insert description here
// You can write your code in this 
//stateAI = 0
//baseStateAI = 0
//hp = 0
//tick = 0

//atkwarmuptime =-1
//atkcooldown =-1

//atktime=-1
//initalspd=-1
//hitbox=-1
//warmupspd=-1
//atkcooldown=-1
//stalltime=20
//initalatktime=-1

//spd=0
//dir=0

//attack =1

atkRandomizeTime=0
Hitbox = instance_create_depth(x,y,0,obj_enemyHitbox) //PESONALLY ASSIGNED WEAPON HITBOX
Hitbox.mask_index=sp_null
spd=0


maxAtkRandomizeTime=60
AIstate=0
sightRange= 2000


//variables stay at -1 for inactive
// when they hit 0 they stay 0 until they stop attacking