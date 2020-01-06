screenshake = 0

viewh = camera_get_view_width(view_camera[0])
viewv = camera_get_view_height(view_camera[0])
screenScale=1
noshakey=0
angle =0
startingangle=0

x=obj_player.x
y=obj_player.y


iniScreenZoomTime=0
screenZoomTime=0
Zoom=0
realAngle=0
iniScreenRotateTime=0 //this is here only for if we want to add other types of curves instead of just linear
screenRotateTime=0

iniScreenshakeTime=0
screenshakeTime=0
screenshakePower=0


zoomCurve=0
rotateCurve=0
shakeCurve=0
