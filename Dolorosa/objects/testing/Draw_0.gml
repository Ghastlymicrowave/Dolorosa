//for(var i = 45; i< 360; i+=90){
	
	i++
	if i = 360 {i = 0}
	
	var ofx = mouse_x - x
	var ofy = mouse_y - y
	
	var w = 300
	var h = 100
	
	var drawx = lengthdir_x(600,i)
	var drawy = lengthdir_y(600,i)
	
	draw_line(x,y,drawx+x,drawy+y)
	
	var out = RectangleGetAnglePoint(ofx,ofy,i,w,h)
	
	var sprx = out[0]+x
	var spry = out[1]+y
	draw_sprite_ext(sprite_index,0,sprx,spry,1,1,0,c_white,0.80)
	
	draw_line(mouse_x,mouse_y,sprx,spry)
	
	draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_red,0.80)
	draw_sprite(sprite2,0,x+w,y+h)
	draw_sprite(sprite2,0,x-w,y+h)
	draw_sprite(sprite2,0,x+w,y-h)
	draw_sprite(sprite2,0,x-w,y-h)
	
	
//}
