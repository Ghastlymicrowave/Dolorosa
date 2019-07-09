/// @description Insert description here
// You can write your code in this editor



knockback = 20
initalknockbacktime=20// needs to = knockback

knockbackmult = 30//knockback's inital speed

iframes=60

knockbacktype=0 // 1 = radial, 0 = hitbox's direction
// if 0 then dir needs to be set
dir = 0//usually set by enemy when creating
damage=20

multihit=0//will be destroyed after hit unless this is 1
ignoreiframes=0//will hit regardless of the player's iframes