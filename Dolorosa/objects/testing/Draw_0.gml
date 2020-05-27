for(var i = 0; i< 360; i+=20){
	
	var out = RectangleGetAnglePoint(0,0,i,200,200)
	var sprx = out[0]+x
	var spry = out[1]+y
	//show_debug_message(spry)
	draw_sprite(sprite_index,0,sprx,spry)
	draw_sprite_ext(sprite_index,0,sprx,spry,1,1,0,c_red,1)
	
	//draw_line(x+60,y-10,sprx,spry)
	
	
	
	
	var ofx = mouse_x - x
	var ofy = mouse_y - y
	
	
	
	
	
	
	var drawx = lengthdir_x(250,i)
	var drawy = lengthdir_y(250,i)
	draw_line(x+ofx,y+ofy,x+drawx,y+drawy)
	
	
	
	
	var out = RectangleGetAnglePoint(ofx,ofy,i,200,200)
	var sprx = out[0]+x
	var spry = out[1]+y
	draw_sprite_ext(sprite_index,0,sprx,spry,1,1,0,c_white,0.80)
	//var out = RectangleGetAnglePoint(ofx,ofy,i,200,200)
	//var sprx = out[0]+x
	//var spry = out[1]+y
	//draw_sprite_ext(sprite_index,0,sprx,spry,1,1,0,c_white,0.80)
	
	
	

}
