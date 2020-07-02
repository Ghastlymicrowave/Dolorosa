///@func clockwise_closest(origin,return,point,return...)
///@arg origin
///@arg return
///@arg point
///@arg return...

var out = noone
var diff = 400
var i = 0
repeat(argument_count/2-1){
	i++
	if(argument[i*2]>argument[0]){
		if((argument[i*2]-argument[0]<diff)){
			out=argument[i*2+1]
		}
	}else{
		if((argument[i*2]+400-argument[0]<diff)){
			out=argument[i*2+1]
		}
	}
}
return out