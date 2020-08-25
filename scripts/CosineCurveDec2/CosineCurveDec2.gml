///@func CosineCurveDec2( tick, inital)
///@desc
///@arg tick variable
///@arg inital value
function CosineCurveDec2(argument0, argument1) {
	//return cos(((argument0-argument1)*pi)/(argument1*2))

	//antiderivitive \/
	//return (2*argument[1])/pi * sin(((-argument1+argument0)*pi)/(2*argument1))

	return (-cos((argument0*pi)/argument1)+1)/2


}
