function DistanceCheck() {
	//set distance and duration, find force

	var e = argument[0]//distance
	var b = argument[1]//duration
	var c = argument[2]//min spd
	var d = argument[3]//max spd
	var percision = argument[4]//minimum allowed percentage,as a decimal number
	var maxSteps = argument[5]

	var a = 1//force
	var range = 1
	var flip = -1
	var flips=1
	var lastFlip = 0
	//var flip = -1 // means was previously greater (1) or less(0) than target value, starts -1
	for (var i = 0; i< maxSteps; i++){

		var z=(d * (a - d) * b/a) + (( ((a - c ) * b/a - (a - d) * b/a) * ( (a - ((a - d) * b/a*a/b)) -  (a - ((a - c ) * b/a*a/b))     ) ) /2 + ((a - c ) * b/a - (a - d) * b/a) * c) + ((b - ((a - c ) * b/a)) * (a - ((a - c ) * b/a*a/b)))


	
		if z > e 
		{ 
			flip=1
		}
		else
		{
			flip=0
		}
		
		if i == 0{
			lastFlip = flip
		} 
	
		if z == e || abs(z - e) < e*percision
		{ 
			return a; 
		} 
		else 
		{
			if lastFlip!=flip{
				flips++	
			}
		
			lastFlip = flip
		
			if z > e 
			{ 
				a-= range/flips
				flip = 1
			}
			else
			{
				a+= range/flips
				flip = 0
			}
		
		
		}
	show_debug_message(a)
	show_debug_message(flip)
	show_debug_message(string(z)+"?"+string(e)+"    Error within "+string(e*percision))
	show_debug_message("STEP:"+string(i))
	if i== maxSteps{return a; }
	}
	//n0 = (a - d) * b/a
	//n1 = d * (a - d) * b/a

	//o0 = (a - c ) * b/a
	//o2 = (a - c ) * b/a - (a - d) * b/a
	//o1 = (( ((a - c ) * b/a - (a - d) * b/a) * ( (a - ((a - d) * b/a*a/b)) -  (a - ((a - c ) * b/a*a/b))     ) ) /2 + ((a - c ) * b/a - (a - d) * b/a) * c)
	////correct now ^
	//p1 = ((b - ((a - c ) * b/a)) * (a - ((a - c ) * b/a*a/b)))
	////correct now ^
	//z = d * (a - d) * b/a + ((a - c ) * b/a - (a - d) * b/a*((a-((a - d) * b/a*a/b))-(a-((a - c ) * b/a*a/b))))/2+((a - c ) * b/a - (a - d) * b/a)*c + (b - (a - c ) * b/a) * (a-((a - c ) * b/a*a/b)) + ((a - c ) * b/a - (a - d) * b/a*((a-((a - d) * b/a*a/b))-(a-((a - c ) * b/a*a/b))))/2+((a - c ) * b/a - (a - d) * b/a)*c + ((a - c ) * b/a - (a - d) * b/a*((a-((a - d) * b/a*a/b))-(a-((a - c ) * b/a*a/b))))/2+((a - c ) * b/a - (a - d) * b/a)*c
	////first rectangle
	//var firstArea = 
	////d * (a - d) * b / a
	////triangle and rectangle
	//var secondArea = 
	////(((a-d)*b/a - (a-c)*b/a)*((a-((a-d)*b/a)*a/b)-(a-((a-c)*b/a)*a/b))) + ((a-d)*b/a - (a-c)*b/a) * c
	////final rectangle
	//var thirdArea = 
	////(b - (a - c) * b / a) * (a - (((a - c) * b / a * a) / b))

	////d * (a - d) * b / a + (((a - c) * b / a-(a - d) * b / a) * (a-((a - d) * b / a * a / b)))/2 + (a - c) * b / a * ((a - c) * b / a -(a - d) * b / a) + (b - (a - c) * b / a)/2 * (a - (((a - c) * b / a * a) / b))


	//the negative equivelent
	//a = -(b * sqrt( (24*c*c-16*c*d)*e+d*d*d*d+(2*c-4*b)*d*d*d+(c*c+18*b*c+4*b*b)*d*d+((-10*b*c*c)-12*b*b*c)*d-12*b*c*c*c+9*b*b*c*c+b*d*d+(b*c-2*b*b)*d-3*b*b*c) )/(4*e-4*b*d-2*b*c)






}
