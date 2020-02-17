/// @description Insert description here
// You can write your code in this editor

//create inventory
global.inventory = ds_list_create()


maxEquips=4

global.currentEquips=ds_list_create()
ds_list_add(global.currentEquips,1)
ds_list_add(global.currentEquips,1)

objectsPerRow=3
MaxRowsPerPage=8
//inventorycreated=0


uiPresets[4,4]=0
/*
xoffset
yoffset
widthcale
heightscale (percents of screen)
*/
//	x cord is panel, 
//0 Item inventory
//1 Equips window


uiPresets[0,0]=0.05
uiPresets[0,1]=0.1
uiPresets[0,2]=0.40
uiPresets[0,3]=0.8

uiPresets[1,0]=0.5
uiPresets[1,1]=0.3
uiPresets[1,2]=0.45
uiPresets[1,3]=0.5

side=0


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

var sizedivided = floor(ds_list_size(global.inventory)/objectsPerPage)
while ds_list_size(global.inventory)<sizedivided*objectsPerPage||ds_list_size(global.inventory)=0{
	ds_list_add(global.inventory,0) // fill with blank values until page fills
	sizedivided = floor(ds_list_size(global.inventory)/objectsPerPage)
}

