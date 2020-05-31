
//create inventory
onetick=0
horizdistance=0
horizmove=0

global.inventory = ds_list_create()


global.currentEquips=ds_list_create()

global.activeEquips = ds_list_create()
global.itemTimers = ds_list_create()

//location slots are percentages of 100 for location on the map window
//format for locations is:
//
//	locationSlot[locationRefId,0] = x percent
//	locationSlot[locationRefId,0] = y percent
//

locationSlot[0,0]=.10;locationSlot[0,1]=.50
locationSlot[1,0]=.20;locationSlot[1,1]=.60
locationSlot[2,0]=.30;locationSlot[2,1]=.70
locationSlot[3,0]=.40;locationSlot[3,1]=.80
locationSlot[4,0]=.50;locationSlot[4,1]=.90
locationSlot[5,0]=.60;locationSlot[5,1]=.80
locationSlot[6,0]=.70;locationSlot[6,1]=.70

//locations are displayed if the locationSlot array contains the location ref id
//	and the currentLocations global list contains the id

global.currentMapLocations = ds_list_create()
ds_list_add(global.currentMapLocations,0)
ds_list_add(global.currentMapLocations,1)
ds_list_add(global.currentMapLocations,2)
ds_list_add(global.currentMapLocations,3)
ds_list_add(global.currentMapLocations,4)
ds_list_add(global.currentMapLocations,5)
ds_list_add(global.currentMapLocations,6)



ds_list_add(global.currentEquips,1)
ds_list_add(global.currentEquips,1)

//inventory display variables - self explanitory
objectsPerRow=3
MaxRowsPerPage=4

//maximum items you can equip at once
maxEquips=8

obj_inventoryControl.slot = 0


uiPresets[4,4]=0	//initalize uiPresets array
/*
[X,0] xoffset (from top left)
[X,1] yoffset (from top left)
[X,2] widthcale (percent of screen)
[X,3] heightscale (percent of screen)

X = side

side is the position, ( and by extension the ref id ) of a menu panel
*/
//0 Item inventory
//1 Equips window


uiPresets[0,0]=0.05 // inventory
uiPresets[0,1]=0.1
uiPresets[0,2]=0.40
uiPresets[0,3]=0.8

uiPresets[1,0]=0.5 // equips
uiPresets[1,1]=0.3
uiPresets[1,2]=0.45
uiPresets[1,3]=0.5

uiPresets[2,0]=0.225 // map 
uiPresets[2,1]=0.05
uiPresets[2,2]=0.75
uiPresets[2,3]=0.90

uiPresets[2,4]=0.025  // the actual UI of the map menu
uiPresets[2,5]=0.05
uiPresets[2,6]=0.2
uiPresets[2,7]=0.90

uiPresets[3,0]=0.05 // map 
uiPresets[3,1]=0.05
uiPresets[3,2]=0.90
uiPresets[3,3]=0.90

obj_inventoryControl.side=0

depth=-5
image_alpha=0.5

obj_inventoryControl.lastslotx=0
obj_inventoryControl.lastsloty=0



page=0
//pageheight=ivh/2  

followpageheight=0

var objectsPerPage=objectsPerRow*MaxRowsPerPage

ini_open("save.data") //read stored inventory
ds_list_read(global.inventory,ini_read_string("general","inventory",ds_list_create()))
ini_close()

//DEBUG ONLY, fills inventory with id 0 inventory objects
var sizedivided = floor(ds_list_size(global.inventory)/objectsPerPage)
while ds_list_size(global.inventory)<sizedivided*objectsPerPage||ds_list_size(global.inventory)=0{
	ds_list_add(global.inventory,0) // fill with blank values until page fills
	sizedivided = floor(ds_list_size(global.inventory)/objectsPerPage)
}

