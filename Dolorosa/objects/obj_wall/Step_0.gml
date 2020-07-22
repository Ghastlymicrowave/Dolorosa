/// @description Insert description here
// You can write your code in this editor
x=coords[0]
y=coords[1]
image_angle=point_direction(coords[0],coords[1],coords[2],coords[3])
if(point_distance(coords[0],coords[1],coords[2],coords[3])>15){
	image_xscale=point_distance(coords[0],coords[1],coords[2],coords[3])
}else{instance_destroy()}