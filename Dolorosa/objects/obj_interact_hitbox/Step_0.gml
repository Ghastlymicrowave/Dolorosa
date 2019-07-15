/// @description Insert description here
// You can write your code in this editor

#region pickups and interactables
if(instance_exists(prnt_interactable))&&obj_player.gamepaused=0{
var interactableID = instance_nearest(x,y,prnt_interactable)
if(keyboard_check_pressed(ord("E"))&&(place_meeting(x,y,interactableID)||place_meeting(obj_player.x,obj_player.y,interactableID))){
interactableID.interacted = 1
}
}
#endregion