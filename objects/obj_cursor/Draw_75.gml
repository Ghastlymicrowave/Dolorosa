

wobblex= (cos((pi*wobbletimer)/60)/2 +0.5) * boxWidth/4 
wobbley= (cos((pi*wobbletimer)/60)/2 +0.5) * boxHeight/4

var scalex = (boxWidth+wobblex)/ sprite_get_width(sprite_index)
var scaley = (boxHeight+wobbley)/ sprite_get_height(sprite_index)

smoothScaleX += (scalex-smoothScaleX)*scaleSpd
smoothScaleY += (scaley-smoothScaleY)*scaleSpd
//draw_sprite_ext(sprite_index,0,ConvertRealtoGUI(xSmooth,0),ConvertRealtoGUI(ySmooth,1),smoothScaleX,smoothScaleY,0,c_white,image_alpha)
draw_sprite_ext(sprite_index,0,ConvertRealtoGUI(gotox,0),ConvertRealtoGUI(gotoy,1),smoothScaleX,smoothScaleY,0,c_white,image_alpha)
//draw_sprite_ext(sprite_index,0,ConvertRealtoGUI(xSmooth-xvar1,0),ConvertRealtoGUI(ySmooth-yvar1,1),smoothScaleX,smoothScaleY,0,c_white,image_alpha)