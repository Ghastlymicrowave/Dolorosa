
hp = 100
walkspd=15
sightRange= 2000
stagger=0
staggertimer=0

staggerthresh=10


initalspd=0
hitbox=1

initalatktime=0
knockbacktime=0

attack =0

atkRandomizeTime=0
Hitbox = instance_create_depth(x,y,0,obj_enemyHitbox) //PESONALLY ASSIGNED WEAPON HITBOX
Hitbox.mask_index=sp_thing
Hitbox.sprite_index=sp_arrow
Hitbox.active=0
spd=0
dir=0

atktime=0
atkwarmuptime=0
atkcooldown=0

maxAtkRandomizeTime=60
AIstate=0

stunnedTime=0
iframes=0
/*
mp_potential_step_object()*/
//variables stay at -1 for inactive
// when they hit 0 they stay 0 until they stop attacking