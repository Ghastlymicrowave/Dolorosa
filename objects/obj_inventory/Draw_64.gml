var a = application_get_position();

var xoff = a[0];
var yoff = a[1];

if obj_cursor.keyboardInUse==0{
	mouseX=(window_mouse_get_x()-xoff)/(window_get_width()-xoff*2) * surface_get_width(application_surface)
	mouseY=(window_mouse_get_y()-yoff)/(window_get_height()-yoff*2) * surface_get_height(application_surface)
} else {
	mouseX=ConvertRealtoGUI(obj_cursor.x,0)
	mouseY=ConvertRealtoGUI(obj_cursor.y,1)
}



ivw=surface_get_width(application_surface)//display_get_gui_width()//		/wscale
ivh=surface_get_height(application_surface)//display_get_gui_height()//		/hscale
scw=surface_get_width(application_surface)
sch=surface_get_height(application_surface)

image_xscale=ivw/sprite_get_width(sprite_index)
image_yscale=ivh/sprite_get_height(sprite_index)

depth=-500


if obj_player.playerstate==playerstates.inventory{ //check if player has menu open
	
	var w = ivw

	 if (abs(horizdistance*ivw-horizmove)>1)||onetick=1{//draw all if moving from one screen to another
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[0,0]-horizmove,ivh*uiPresets[0,1],uiPresets[0,2]*ivw/sprite_get_width(sprite_index),uiPresets[0,3]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[1,0]-horizmove,ivh*uiPresets[1,1],uiPresets[1,2]*ivw/sprite_get_width(sprite_index),uiPresets[1,3]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[2,0]-horizmove+w,ivh*uiPresets[2,1],uiPresets[2,2]*ivw/sprite_get_width(sprite_index),uiPresets[2,3]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[2,4]-horizmove+w,ivh*uiPresets[2,5],uiPresets[2,6]*ivw/sprite_get_width(sprite_index),uiPresets[2,7]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[3,0]-horizmove+w*2,ivh*uiPresets[3,1],uiPresets[3,2]*ivw/sprite_get_width(sprite_index),uiPresets[3,3]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
		onetick=0
		}else{
		 
		 switch obj_inventoryControl.side {//side is the panel of the menu you are on, this determines which one is drawn
	case 0:
	case 1:
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[0,0]-horizmove,ivh*uiPresets[0,1],uiPresets[0,2]*ivw/sprite_get_width(sprite_index),uiPresets[0,3]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[1,0]-horizmove,ivh*uiPresets[1,1],uiPresets[1,2]*ivw/sprite_get_width(sprite_index),uiPresets[1,3]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
	break;
	case 2:
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[2,0]-horizmove+w,ivh*uiPresets[2,1],uiPresets[2,2]*ivw/sprite_get_width(sprite_index),uiPresets[2,3]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[2,4]-horizmove+w,ivh*uiPresets[2,5],uiPresets[2,6]*ivw/sprite_get_width(sprite_index),uiPresets[2,7]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
	break;
	case 3:
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[3,0]-horizmove+w*2,ivh*uiPresets[3,1],uiPresets[3,2]*ivw/sprite_get_width(sprite_index),uiPresets[3,3]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
	break;
}
	 }
	
	
	if obj_inventoryControl.side=0||obj_inventoryControl.side=1{  //convert this page int to an array of ints, one for any page with other scrolls
		page = floor(obj_inventoryControl.sloty/MaxRowsPerPage)
	}else page = 0
	
	horizmove += clamp((horizdistance*ivw-horizmove)/8,-ivw/40,ivw/40)
	
	var ivx=scw*uiPresets[0,0]+horizmove
	var ivy=sch*uiPresets[0,1]
	var panelW=scw*uiPresets[0,2]//		/wscale
	var panelH=sch*uiPresets[0,3]//	/hscale
	
	//debug for scaling
	//draw_sprite(sp_badCircle,0,ivx,0)
	//draw_sprite(sp_badCircle,0,ivw*uiPresets[0,0],0)
	
	var ivSize=ds_list_size(global.inventory)
	var ivDivided=ivSize/objectsPerRow
	
	if obj_inventoryControl.side=0||obj_inventoryControl.side=1||abs(horizmove-horizdistance*ivw)>1{

	gotopageheight=(page*panelH+page)
	followpageheight+= (gotopageheight-followpageheight)/2

#region side 0, charms iv

for (var i = 0; i<ivDivided;i++){//for each full row, draws rows differently because it's a full row and not a partially empty row

		for (var iii=floor(i*objectsPerRow); iii<ivSize&&iii<floor(i*objectsPerRow)+objectsPerRow;iii++){ //iii = starting id of row

			var xx = ivx+(iii-round(i*objectsPerRow))*panelW/objectsPerRow+(panelW/objectsPerRow)/panelW+panelW/objectsPerRow/2
			var yy = ivy+i*panelH/MaxRowsPerPage+((i+1)*panelH/MaxRowsPerPage)/panelH+panelH/MaxRowsPerPage/2 -followpageheight

			if obj_player.playerstate==playerstates.inventory && (obj_cursor.keyboardMenus=1||obj_cursor.keyboardMenus=2)&&(obj_inventoryControl.sloty=i&&obj_inventoryControl.slotx=iii-floor(i*objectsPerRow))&&obj_inventoryControl.side=0{

			obj_cursor.keyboardx=xx
			obj_cursor.keyboardy=yy
			obj_inventoryControl.lastslotx=obj_inventoryControl.slotx
			obj_inventoryControl.lastsloty=obj_inventoryControl.sloty
			obj_cursor.boxWidth = panelW/objectsPerRow 
			obj_cursor.boxHeight = panelH/MaxRowsPerPage
			}
			
			var spr = sp_placeholderItem
			var str = "placeholder"
	
			str = item_library_get_name(ds_list_find_value(global.inventory,iii))
			spr = item_library_get_sprite(ds_list_find_value(global.inventory,iii))
			
			draw_sprite(spr,depth-1,xx,yy)
			draw_text(xx,yy+50,str)
			
			var x1 = xx-panelW/objectsPerRow/2
			var y1 = yy-panelH/MaxRowsPerPage/2
			var x2 = xx+panelW/objectsPerRow/2
			var y2 = yy+panelH/MaxRowsPerPage/2
			draw_rectangle(x1,y1,x2,y2,1)
			if point_in_rectangle(mouseX,mouseY,x1,y1,x2,y2){
			if mouse_check_button_released(mb_left)&&obj_inventoryControl.side=0{
			
			show_debug_message("clicked item "+ string(iii)+" object: "+ string(ds_list_find_value(global.inventory,iii)))
			
			if  (ds_list_size(global.currentEquips)>0&&ds_list_find_index(global.currentEquips,ds_list_find_value(global.inventory,iii))==-1)||(ds_list_size(global.currentEquips)==0){
				items_equip(ds_list_find_value(global.inventory,iii))
			}
			}else if obj_inventoryControl.side!=0 && obj_cursor.keyboardInUse==0{
			obj_inventoryControl.side=0	
			}
		}
	}
}

#endregion


#region side 1, equips

	var ivx=scw*uiPresets[1,0]+horizmove
	var ivy=sch*uiPresets[1,1]
	var panelW=scw*uiPresets[1,2]//		/wscale
	var panelH=sch*uiPresets[1,3]//	/hscale

for (var i = 0; i<maxEquips;i++){
	var xx = (i+1)*panelW/(maxEquips+1)+ivx
	var yy = ivy+panelH/2
	
	if obj_player.playerstate==playerstates.inventory && (obj_cursor.keyboardMenus=1||obj_cursor.keyboardMenus=2)&&(obj_inventoryControl.slotx=i)&&obj_inventoryControl.side=1{

			obj_cursor.keyboardx=xx
			obj_cursor.keyboardy=yy
			obj_inventoryControl.lastslotx=obj_inventoryControl.slotx
			obj_inventoryControl.lastsloty=obj_inventoryControl.sloty
			obj_cursor.boxWidth = panelW/maxEquips
			obj_cursor.boxHeight = panelW/maxEquips
			}
	
	//look into the array of items based on the item in the list
	
	if i < ds_list_size(global.currentEquips){
		
		//switch based on the item's info
		var spr = sp_placeholderItem
		var str = "placeholder"
	
		str = item_library_get_name(ds_list_find_value(global.currentEquips,i))
		spr = item_library_get_sprite(ds_list_find_value(global.currentEquips,i))
		draw_text(xx,yy+50,str)
		
		var sprw =sprite_get_width(spr)
		var sprh =sprite_get_height(spr)
	draw_rectangle(xx-sprw/2,yy-sprh/2,xx+sprw/2,yy+sprh/2,5)	
		
		
		
		var x1 =  xx-sprw/2
		var x2 =  xx+sprw/2
		var y1 =  yy-sprh/2
		var y2 =  yy+sprh/2
		
		
		if point_in_rectangle(mouseX,mouseY,x1,y1,x2,y2){//collision_rectangle(x1,y1,x2,y2,obj_cursor,1,1){
			
			if mouse_check_button_released(mb_left)&&obj_inventoryControl.side=1{
			show_debug_message("clicked item "+ string(i)+" object: "+ string(ds_list_find_value(global.currentEquips,i)))
			items_unequip(ds_list_find_value(global.currentEquips,i))
			}else if obj_inventoryControl.side != 1 && obj_cursor.keyboardInUse==0{
				obj_inventoryControl.side = 1	
			}
		}
	}else{
	
		var spr = sp_placeholderItem
		var str = "placeholder"
	
		str = item_library_get_name(ds_list_find_value(global.currentEquips,i))
		spr = item_library_get_sprite(ds_list_find_value(global.currentEquips,i))
		draw_text(xx,yy+50,str)
		var sprw =sprite_get_width(spr)
		var sprh =sprite_get_height(spr)
	}
	// final / regular = mod
	var wmod = (panelW/(maxEquips+1)) / sprw
	var hmod = (panelW/(maxEquips+1)) / sprh
	draw_sprite_ext(spr,0,xx,yy,wmod,hmod,0,0,1)
	draw_text(xx,yy+50,str)
	//draw_sprite(spr,0,xx,yy)
}
}
#endregion
	
	
	
//something happening earlier stopping code from getting here
#region side 2, map
if obj_inventoryControl.side == 2||abs(horizmove-horizdistance*ivw)>1{


	var ivx=display_get_gui_width()*uiPresets[2,4]+horizmove-w //+ horizdistance*ivw
	var ivy=display_get_gui_height()*uiPresets[2,5]
	var panelW=display_get_gui_width()*uiPresets[2,6]//		/wscale
	var panelH=display_get_gui_height()*uiPresets[2,7]//	/hscale

	var ivx1=display_get_gui_width()*uiPresets[2,0]+horizmove-w //+ horizdistance*ivw
	var ivy1=display_get_gui_height()*uiPresets[2,1]
	var panelW1=display_get_gui_width()*uiPresets[2,2]//		/wscale
	var panelH1=display_get_gui_height()*uiPresets[2,3]//	/hscale

for (var i = 0; i<ds_list_size(global.currentMapLocations);i++){

	var xx = ivx+panelW/2
	var yy = ivy+(i+1)*panelH/(ds_list_size(global.currentMapLocations)+1)
	
	
	if obj_player.playerstate==playerstates.inventory && (obj_cursor.keyboardMenus=1||obj_cursor.keyboardMenus=2)&&(obj_inventoryControl.sloty==i)&&obj_inventoryControl.side=2{
				
			obj_cursor.keyboardx=xx
			obj_cursor.keyboardy=yy
			obj_inventoryControl.lastslotx=obj_inventoryControl.slotx
			obj_inventoryControl.lastsloty=obj_inventoryControl.sloty
			obj_cursor.boxWidth = panelW
			obj_cursor.boxHeight = panelH/ds_list_size(global.currentMapLocations)
			}

	var spr = sp_placeholderItem
	var str = "placeholder"
	
	

	draw_sprite(spr,0,ivx1+panelW1*locationSlot[ds_list_find_value(global.currentMapLocations,i),0],ivy1+panelH1*locationSlot[ds_list_find_value(global.currentMapLocations,i),1])
	
	draw_sprite(spr,0,xx,yy)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text_ext_transformed(xx,yy-sprite_get_height(spr)/4,str,1,sprite_get_width(spr),4,4,0)
	if i < ds_list_size(global.currentMapLocations){
		
		//switch based on the item's info
		
		
	draw_rectangle(xx-sprite_get_width(spr)/2,yy-sprite_get_height(spr)/2,xx+sprite_get_width(spr)/2,yy+sprite_get_height(spr)/2,5)	
		
		var x1 = xx-sprite_get_width(spr)/2
		var x2 = xx+sprite_get_width(spr)/2
		var y1 = yy-sprite_get_height(spr)/2
		var y2 = yy+sprite_get_height(spr)/2
		
		if point_in_rectangle(mouseX,mouseY,x1,y1,x2,y2){
			
			
			if mouse_check_button_released(mb_left)&&obj_inventoryControl.side=2{
			show_debug_message("clicked item "+ string(i))
			//clicked
			}
		}
	}else{
	
	var spr = sp_thing

	}
}
}


#endregion


}
