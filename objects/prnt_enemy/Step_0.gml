/// @description Insert description here
// You can write your code in this editor
#region Initialize States
stateAI = baseStateAI
if(/*PLAYER DETECTION CONDITION GOES HERE*/ true){
baseStateAI = 1
}
if(distance_to_object(obj_player)<=/*ATTACK RANGE GOES HERE*/1){
stateAI++
}
#endregion
#region Execute States
switch(stateAI){
case 0:

//IDLE/WALKING CODE GOES HERE

//IDLE/WALKING CODE GOES HERE

break;
case 1:

//PATHFIND CODE GOES HERE

//PATHFIND CODE GOES HERE

break;
case 2:

//ATTACKING CODE GOES HERE
tick++
	switch(tick){
	case 360:
	tick = 0
	break;
	}
//ATTACKING CODE GOES HERE

break;
}
#endregion