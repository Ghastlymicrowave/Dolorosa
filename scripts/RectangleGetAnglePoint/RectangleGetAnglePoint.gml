///@func RectangleGetAnglePoint(offsetX, offsetY, angle, width, height)
///@desc returns an 2 slot 1d array containing the point's x and y cords
///@arg offsetX		point relative to the center of the rectangle where the line is drawn to
///@arg offsetY
///@arg angle
///@arg width
///@arg height
function RectangleGetAnglePoint() {


	//gets a point on the outer edge of a rectangle from a the centerpoint and the width and height

	var offsetX = argument[0]//c
	var offsetY = argument[1]//d
	var angl = argument[2]
	var wdth = argument[3]
	var hght = argument[4]

	var flag = 0
	angl = -angl+360

	if (angl > 45 && angl < 135) || (angl > 225 && angl < 315){
	angl+= 180	
	}

	var i = dtan(angl)*(wdth-offsetX)+offsetY
	var j = dtan(angl)*(-wdth-offsetX)+offsetY
	var k = -1/dtan(angl)*(offsetY+hght)+offsetX
	var l = -1/dtan(angl)*(offsetY-hght)+offsetX

	var output = array_create(2,0)

	var angleSide = round( angl / 90 ) 

	angleSide = angleSide % 4

	if angleSide < 0 {
	angleSide = 4 + angleSide
	//angleSide += 2
	angleSide = angleSide % 4
	flag = 1
	}

	/*
	0 = right
	1 = top
	2 = left
	3 = bottom
	*/

	/*
								1/-3
						2/-2				0
								3/-1

	*/

	switch(angleSide){
	case 0:
		if i > hght{
			angleSide = 3
		}else if i < -hght{
			angleSide++
		}
	break;
	case 1:
		if k > wdth{
			angleSide--
		}else if k < -wdth{
			angleSide++
		}
	break;
	case 2:
		if j > hght{
			angleSide++
		}else if j < -hght{
			angleSide--
		}
	break;
	case 3:
		if l > wdth{
			angleSide = 0
		}else if l < -wdth{
			angleSide --
		}
	break;
	}


	switch (angleSide){
	case 0:
	//draw_sprite(sprite2,0,x+wdth,y+i)//right
	output[0] = wdth
	output[1] = i
	output[2] = angleSide*100+(hght+i)/(2*hght)*100
	break;
	case 1:
	//draw_sprite(sprite2,0,x+k,y-hght)//top
	output[0] = k
	output[1] = -hght
	output[2] = angleSide*100+(wdth+k)/(2*wdth)*100
	break;
	case 2:
	//draw_sprite(sprite2,0,x-wdth,y+j)//left
	output[0] = -wdth
	output[1] = j
	output[2] = angleSide*100+(hght+j)/(2*hght)*100
	break;
	case 3:
	//draw_sprite(sprite2,0,x+l,y+hght)//bottom
	output[0] = l
	output[1] = hght
	output[2] = angleSide*100+(wdth+l)/(2*wdth)*100
	break;
	
	}

	//
	//
	//

	//if point_in_rectangle()

	if flag == 1{
	//var a = -output[0]
	//var b = -output[1]	
	//	show_message(string(output[0])+string(output[1])+" : "+string(a)+string(b))
	//output[0] = a
	//output[1] = b

	
	}

	return output















}
