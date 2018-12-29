/// @description Insert description here
// You can write your code in this editor

//create inventory
global.inventory = ds_list_create()
objectsPerRow=3
MaxRowsPerPage=1
//inventorycreated=0

xoffset=150
yoffset=40
wscale=1.5
hscale=1.5

ivx=camera_get_view_x(view_camera[0])+xoffset
ivy=camera_get_view_y(view_camera[0])+yoffset
ivw=camera_get_view_width(view_camera[0])/wscale
ivh=camera_get_view_height(view_camera[0])/hscale

ivx1=xoffset/camera_get_view_width(view_camera[0])
ivy1=yoffset/camera_get_view_height(view_camera[0])
ivw1=ivw
ivh1=ivh

depth=-5
image_alpha=0.5

lastslotx=0
lastsloty=0

page=0
pageheight=ivh
followpageheight=0