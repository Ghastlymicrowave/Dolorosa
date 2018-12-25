/// @description Insert description here
// You can write your code in this editor
//draw_rectangle(ivx,ivy,ivx+ivw,ivy+ivh,2)

ivx=camera_get_view_x(view_camera[0])+xoffset
ivy=camera_get_view_y(view_camera[0])+yoffset
ivw=camera_get_view_width(view_camera[0])/wscale
ivh=camera_get_view_height(view_camera[0])/hscale

x=ivx
y=ivy

image_xscale=ivw/sprite_get_width(sprite_index)
image_yscale=ivh/sprite_get_height(sprite_index)

//show_debug_message(string(image_xscale))