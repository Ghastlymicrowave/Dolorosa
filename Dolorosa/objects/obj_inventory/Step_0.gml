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
	
	var pages=(page-1)*objectsPerRow*MaxRowsPerPage
	for (var i = pages; i<floor(ivDivided);i++){//for each full row
	//loops for each full row
	
	//if i > MaxRowsPerPage-1 then break;
	
	for (var ii=0; ii<objectsPerRow;ii++){
		var xx = ivx+ii*ivw/objectsPerRow+((ii+1)*ivw/objectsPerRow)/ivw+ivw/objectsPerRow/2
		var yy = ivy+i*ivh/MaxRowsPerPage+((i+1)*ivh/MaxRowsPerPage)/ivh+ivh/MaxRowsPerPage/2
		instance_create_depth(xx,yy,-1,obj_inventoryItem)	
	}
	
	//x = ii*width/objectsPerRow
	//make annother for loop for each object using ii as the horiz location
	//draws object in slot (MaxRowsPerPage*(page-1)+ii)
	}
	show_debug_message(string(i)+"full rows")
	if floor(ivDivided)!=ivDivided{
		
		
		for (var iii=floor(i*objectsPerRow); iii<ivSize;iii++){ //iii = 0+floor(i*objectsPerRow)
			show_debug_message(string(iii)+"leftover")
			var xx = ivx+(iii-floor(i*objectsPerRow))*ivw/objectsPerRow+((iii+1)*ivw/objectsPerRow)/ivw+ivw/objectsPerRow/2
			var yy = ivy+i*ivh/MaxRowsPerPage+((i+1)*ivh/MaxRowsPerPage)/ivh+ivh/MaxRowsPerPage/2
			instance_create_depth(xx,yy,-1,obj_inventoryItem)	
			
			//loops for each object in spare row
		}
	}else {show_debug_message("none leftover")}

} 
}


if obj_player.inventoryopen = 0 { inventorycreated=0page=1} 