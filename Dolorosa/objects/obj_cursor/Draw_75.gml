var onGridX= round(x - (x%2))
var onGridY= round(y - (y%2))

draw_sprite_ext(sprite_index,0,ConvertRealtoGUI(onGridX,0),ConvertRealtoGUI(onGridY,1),2,2,0,c_white,image_alpha)