xOrigin = 0//camera_get_view_width(view_camera[0])/2
yOrigin = 0//camera_get_view_height(view_camera[0])/2

/*
var view_W = camera_get_view_width(view_camera[0])
var view_H = camera_get_view_height(view_camera[0])
*/

panning=0

camPos_x = camera_get_view_x(view_camera[0])
camPos_y = camera_get_view_y(view_camera[0])

var cameraW = camera_get_view_width(view_camera[0])
var cameraH = camera_get_view_height(view_camera[0])

camera_set_view_pos(view_camera[0],-cameraW/2,-cameraH/2)
objIndex = asset_get_index("obj_1")

gridW = 64
gridH = 64

grid = 1

roomW = 100
roomH = 100

scaleMode = 0 
//0 is room
//1 is grid
//2 is object scale

rotation = 0
scaleW = 1
scaleH = 1

cursorMode = 0
//0 is place
//1 is select

offsetX = 0
offsetY = 0

localPosition = 0

targetObject = noone;

room_speed=144