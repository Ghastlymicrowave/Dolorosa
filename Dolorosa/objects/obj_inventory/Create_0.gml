/// @description Insert description here
// You can write your code in this editor

//create inventory
global.inventory = ds_list_create()



maxEquips=3
objectsPerRow=1
MaxRowsPerPage=4
//inventorycreated=0

xoffset=100
yoffset=100
wscale=1.5
hscale=1.2
xoffsetA=0
yoffsetA=0
wscaleA=1
hscaleA=1
side=0

	xoffset0=0.05
	yoffset0=0.1
	wscale0=0.3
	hscale0=0.75

	xoffset0A=0.4
	yoffset0A=0.4
	wscale0A=0.55
	hscale0A=0.5
	
	xoffset1=0.4
	yoffset1=0.1
	wscale1=0.75
	hscale1=0.75
	
	
	

ivx=camera_get_view_x(view_camera[0])+xoffset
ivy=camera_get_view_y(view_camera[0])+yoffset
ivw=camera_get_view_width(view_camera[0])/wscale
ivh=camera_get_view_height(view_camera[0])/hscale
/*
ivx1=xoffset/camera_get_view_width(view_camera[0])
ivy1=yoffset/camera_get_view_height(view_camera[0])
ivw1=ivw
ivh1=ivh*/

depth=-5
image_alpha=0.5

lastslotx=0
lastsloty=0

heldtime =0 
heldwaittime=0

page=0
//pageheight=ivh/2  

followpageheight=0

var objectsPerPage=objectsPerRow*MaxRowsPerPage

ini_open("save.data") //read stored inventory
ds_list_read(global.inventory,ini_read_string("general","inventory",ds_list_create()))
ini_close()

ds_list_add(global.inventory,0)

var sizedivided = floor(ds_list_size(global.inventory)/objectsPerPage)
while ds_list_size(global.inventory)<sizedivided*objectsPerPage||ds_list_size(global.inventory)=0{
	ds_list_add(global.inventory,0) // fill with blank values until page fills
	sizedivided = floor(ds_list_size(global.inventory)/objectsPerPage)
}

