///@func RectangleGetAnglePoint(offsetX, offsetY, angle, width, height)
///@desc returns an 2 slot 1d array containing the point's x and y cords
///@arg offsetX		point relative to the center of the rectangle where the line is drawn to
///@arg offsetY
///@arg angle
///@arg width
///@arg height


//gets a point on the outer edge of a rectangle from a the centerpoint and the width and height

var offsetX = argument[0]
var offsetY = argument[1]
var angl = argument[2]
var wdth = argument[3]
var hght = argument[4]

//angl -= angl % 90



//fuck this shit \/
if !( offsetX == 0 && offsetY == 0 ){
	
//	show_debug_message(angl)
//	var temp = RectangleGetAnglePoint(0,0,angl,wdth-(offsetX)*2,hght+(offsetY)*2)//-abs(offsetX)-abs(offsetY)
	
//	angl = point_direction(0,0,temp[0]-(offsetX)*2,temp[1]+(offsetY)*2)	
//	show_debug_message(angl)
	
	if angl > 0 && angl < 90{//topright
	
	}else if angl > 90 && angl < 180{//topleft
	
	}else if angl > 180 && angl < 270{//bottomleft
		
	}else if angl > 270 && angl < 360{//bottomright
	
	} else if angl == 90 {
		
	} else if angl == 180 {
	} else if angl == 270 {
	} else if angl == 360||angl==0 {
	
	}
	
	
	
}


var anglSide = round( angl / 90 ) 

anglSide = anglSide % 4




//while anglSide < 0{
//	anglSide += 4
//}

// 0 = 0
// 1 = 90
// 2 = 180
// 3 = 270

var horiz = (anglSide==0||anglSide==2) //1 is horiz, 0 is vert




//if horiz{
//	angl = point_direction(offsetX,offsetY,lengthdir_x(wdth*2,angl),lengthdir_y(wdth*2,angl))+180
//} else {
//	angl = point_direction(offsetX,offsetY,lengthdir_x(hght*2,angl),lengthdir_y(hght*2,angl))+180
//}

// anglSide = round( angl / 90 ) 
//anglSide = anglSide % 4
//horiz = (anglSide==0||anglSide==2)

//if horiz{
//	if anglSide == 0 {
//		wdth-=offsetX
//	}else{
//		wdth+=offsetX
//	}
//} else {
//	if anglSide == 1 {
//		hght-=offsetY
//	}else{
//		hght+=offsetY
//	}
	
	
//}

//hght-=abs(offsetY)/2 * horiz

	if (horiz){
	
		var outX = wdth/2 - wdth * (anglSide==2)
		var outY = (wdth*dsin(angl))/(2*dcos(angl))
	
	
	}else{
		
		var outX = (hght*dcos(angl))/(2*dsin(angl))
		var outY = hght/2 - hght * (anglSide==3)
	}





var output = array_create(2,0)
output[0] = outX//+offsetX/2
output[1] = outY//+offsetY/2
return output












