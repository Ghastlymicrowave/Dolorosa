///@func ScreenshakeAmt(Amount ,Duration ,MaxRandAngle ,DoubleZoomPercentage ,NoScreenshake )
///@desc does a zoom and a screenshake
///@arg amount
///@arg duration
///@arg maxRandomAngle
///@arg DoubleZoomPercentage
///@arg NoScreenshake
function ScreenshakeAmt() {
	// Argument 0 : screenshake amount
	// Argument 1 : duration in frames
	// Argument 2 : maximum random angle (as random positive num funciton)
	// Argument 3 : zoom, a number probably between 1 and 10, 1 being a full zoom and 10 being hardly noticeable at all

	obj_camera_follow.screenshake =argument[0]
	obj_camera_follow.initalscreenshake =argument[0]
	obj_camera_follow.time = argument[0]*2

	if (random(1)) then mult = 1 else mult = -1


	obj_camera_follow.startingangle = (argument[2]) * mult
	obj_camera_follow.angle=obj_camera_follow.startingangle
	obj_camera_follow.duration = argument[1]
	obj_camera_follow.zoom = argument[3]
	if argument[4]!= 0{
	obj_camera_follow.noshakey=1
	}else obj_camera_follow.noshakey=0


}
