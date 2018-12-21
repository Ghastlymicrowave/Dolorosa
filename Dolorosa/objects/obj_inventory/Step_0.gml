ivx=camera_get_view_x(view_camera[0])+20
ivy=camera_get_view_y(view_camera[0])+20
ivw=500//camera_get_view_width(view_camera[0])-20
ivh=500//camera_get_view_height(view_camera[0])-20



if obj_player.inventoryopen=1{
	var ivSize=ds_list_size(global.inventory)
	var ivDivided=ivSize/objectsPerRow

if MaxRowsPerPage*objectsPerRow<ivSize/(page)&&keyboard_check_pressed(ord("O")) {page ++;inventorycreated=0}
if keyboard_check_pressed(ord("U"))&&page>1 { page --;inventorycreated=0}	


if inventorycreated=0
{


	inventorycreated=1
	
	
	for (var i = 0; i<floor(ivDivided);i++){//for each full row
	//loops for each full row
	
	if i > MaxRowsPerPage-1 then break;
	
	for (var ii=0; ii<objectsPerRow;ii++){
	instance_create_depth(ivx+ii*ivw/objectsPerRow+((ii+1)*ivw/objectsPerRow)/ivw,ivy+(i*ivh/MaxRowsPerPage)+((i+1)*ivh/MaxRowsPerPage)/2,-1,obj_inventoryItem)	
	}
	//x = ii*width/objectsPerRow
	//make annother for loop for each object using ii as the horiz location
	//draws object in slot (MaxRowsPerPage*(page-1)+ii)
	}
	show_debug_message(string(i)+"full rows")
	if floor(ivDivided)!=ivDivided{
		
		show_debug_message("or here")
		for (var ii=0; ii<ivSize-floor(ivDivided);ii++){
			
			instance_create_depth(ivx+ii*ivw/objectsPerRow,ivy+(i+1)*ivh/MaxRowsPerPage,-1,obj_inventoryItem)
			
			//loops for each object in spare row
		}show_debug_message(string(ii)+"leftover")
	}else {show_debug_message("none leftover")}

} 
}


if obj_player.inventoryopen = 0 { inventorycreated=0page=1} 