/// @description Insert description here
// You can write your code in this editor

#region pickups and interactables
if(instance_exists(prnt_interactable))&&obj_player.playerstate==playerstates.standard{
var interactableID = instance_nearest(x,y,prnt_interactable)
if(obj_player.interact&&(place_meeting(x,y,interactableID)||place_meeting(obj_player.x,obj_player.y,interactableID))){
interactableID.interacted = 1
}
}
#endregion