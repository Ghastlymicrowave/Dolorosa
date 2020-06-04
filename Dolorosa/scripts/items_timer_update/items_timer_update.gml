var i = 0
//create timer slots to equal equipped items
while(ds_list_size(global.itemTimers)<ds_list_size(global.currentEquips)){
	ds_list_add(global.itemTimers,0)
	}
while(ds_list_size(global.itemTimers)>ds_list_size(global.currentEquips)){
	ds_list_delete(global.itemTimers,ds_list_size(global.itemTimers)-1)
	}
//update timer slots
for(i=ds_list_size(global.itemTimers)-1;i>=0;i--){
	if(ds_list_find_value(global.itemTimers,i)>0){
		ds_list_set(global.itemTimers,i,ds_list_find_value(global.itemTimers,i)-1)
	}
}