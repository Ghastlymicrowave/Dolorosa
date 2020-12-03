// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_create(segments,head,mid,tail,taper,cornerimg,middleimg){
global.nextsnake=ds_list_create()
	ds_list_add(global.nextsnake,head)
	repeat(segments){
		with(instance_create_depth(x,y,0,mid)){
		ds_list_add(global.nextsnake,id)
		sprite_index=cornerimg
		tail_index=middleimg
		}
	}
	ds_list_add(global.nextsnake,tail)


	for(var i = ds_list_size(global.nextsnake)-2;i>0;i--){
		with(ds_list_find_value(global.nextsnake,i)){
			follower=ds_list_find_value(global.nextsnake,i+1)
			image_xscale=1-(taper*(ds_list_size(global.nextsnake)-i)/ds_list_size(global.nextsnake))
			image_yscale=image_xscale
		}
	}


	for(var i = 1;i<=ds_list_size(global.nextsnake)-1;i++){
		with(ds_list_find_value(global.nextsnake,i)){
			leader=ds_list_find_value(global.nextsnake,i-1)
		}
	}
	ds_list_destroy(global.nextsnake)
}