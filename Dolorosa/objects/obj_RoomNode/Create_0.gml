/// @description Insert description here
// You can write your code in this editor
w=sprite_get_width(sp_roomHitbox)/2
h=sprite_get_height(sp_roomHitbox)/2
starts=ds_list_create()

with(instance_create_depth(x+w,y+h,0,obj_breakstend)){
	cpos=0
}
with(instance_create_depth(x+w,y-h,0,obj_breakstend)){
	cpos=100
}
with(instance_create_depth(x-w,y-h,0,obj_breakstend)){
	cpos=200
}
with(instance_create_depth(x-w,y+h,0,obj_breakstend)){
	cpos=300
}