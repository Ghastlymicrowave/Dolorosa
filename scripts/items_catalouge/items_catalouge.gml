function item_init(){
	with(obj_gameStart){//persistent conatiner for lib
itemsLib[2][1]=0
itemsLib[0][0]="acceleration up"
itemsLib[0][1]=sp_item_placeholder_1
itemsLib[1][0]="maxspd up"
itemsLib[1][1]=sp_item_placeholder_2
itemsLib[2][0]="attackspd up"
itemsLib[2][1]=sp_item_placeholder_3
	}
}




function item_library_get_name(_itemID)
{
	if _itemID == noone {return ""}
	if _itemID = -1 {return ""}
	return obj_gameStart.itemsLib[_itemID][0]
}
function item_library_get_sprite(_itemID)
{
	if _itemID == noone {return sp_inventory1}
	if _itemID = -1 {return sp_inventory1}
	return obj_gameStart.itemsLib[_itemID][1]
}

function items_activate_stats(){

}

//trigger item effects per frame, for items that do more than provide flat stat bonuses
function items_activate() {
	for(var i=ds_list_size(global.currentEquips)-1;i>=0;i--){
		switch(ds_list_find_value(global.currentEquips,i)){
		//the item on equip effect
		case 0:
		if(1/*item conditions*/&&ds_list_find_value(global.itemTimers,i)=0){
	
		}
		default:
		break;
		}
	}


}

function items_equip(_itemID) {

ds_list_add(global.currentEquips,_itemID)
items_update()

}

function items_unequip(_itemID) {

ds_list_delete(global.currentEquips,ds_list_find_index(global.currentEquips,_itemID))
items_update()

}

//called when item sets update to apply updates to stats
function items_update(){
	with(obj_player){
		default_maxspd = base_maxspd
		default_acceleration = base_acceleration
		for(var i=ds_list_size(global.currentEquips)-1;i>=0;i--){
			switch(ds_list_find_value(global.currentEquips,i)){
			case 0:
				default_maxspd+=floor(base_maxspd/4)
			break;
			case 1:
				default_acceleration+=floor(base_acceleration/4)
			break;
			case 2:
			default:
			break;
			}
		}
	}
}


function items_timer_update() {
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


}


