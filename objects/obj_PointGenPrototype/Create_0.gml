randomize()

sprite = sprite_0
//RoomType key

//room 0 = entrance
//room 1 = exit



var w = sprite_get_width(sprite)
var h = sprite_get_height(sprite)

minDist =  sqrt((h*h)+(w*w))
maxDist =  minDist*3

MainRooms = 200
SidePaths = 5




mask_index = sprite



nodesArray[0,0]=0
//nodes array is fomatted with [x,0] being the origin object and [x,1] being the object the line is drawn to

nodesList = ds_list_create()
//create first node
var inst = instance_create_depth(x,y,0,obj_RoomNode)
ds_list_add(nodesList,inst)
inst.image_blend=c_blue
inst.roomType = 0

var checkInst = instance_create_depth(x,y,0,obj_temp_2)
for (var i = 0; i<MainRooms; i++){//loops until every room requrested in the mainrooms var is created sucessfully
	var pos = irandom_range(0,ds_list_size(nodesList)-1)
	var startingSize = ds_list_size(nodesList)-1
	var target = ds_list_find_value(nodesList,pos)
		
		var angle = random_range(0,359)
		var dist = random_range(minDist,maxDist)
		var xpos = lengthdir_x(dist,angle)+target.x
		var ypos = lengthdir_y(dist,angle)+target.y
		
		checkInst.x = xpos
		checkInst.y = ypos
		
		var intersect = 0
		
		for (var a = 0; a < ds_list_size(nodesList)-1; a++){
			var obj1 = nodesArray[a,0]
			var obj2 = nodesArray[a,1]
			
			var list = ds_list_create()//checks if the line is colliding with any of the lines in the array already
			collision_line_list(target.x,target.y,xpos,ypos,obj_RoomNode,false,true,list,true)
			if ds_list_size(list)>1{
				intersect=1
				break;
			}

			if LinesIntersect(target.x,target.y,xpos,ypos,obj1.x,obj1.y,obj2.x,obj2.y,true)!=0{
				intersect=1
				break;
			}
			//check for all lines if object is being placed collding w a line
			if collision_line(obj1.x,obj1.y,obj2.x,obj2.y,obj_temp_2,false,true){
				intersect=1
				break;				
			}
			
		}
		
		
		
		
		
		var obj = instance_nearest(xpos,ypos,obj_RoomNode)
		var distBetween = point_distance(xpos,ypos,obj.x,obj.y)
		
		
		
		if !instance_place(xpos,ypos,obj_RoomNode)&&intersect==0&&distBetween>minDist{
			var newObj = instance_create_depth(xpos,ypos,0,obj_RoomNode)
			nodesArray[startingSize,0] = target
			nodesArray[startingSize,1] = newObj
			ds_list_add(nodesList,newObj)
			if i == MainRooms -1 {
				var firstObj = ds_list_find_value(nodesList,0)
				var newList = ds_list_create()
				image_xscale=1000
				image_yscale=1000
				instance_place_list(firstObj.x,firstObj.y,obj_RoomNode,newList,true)
				var furtherstObj = ds_list_find_value(newList,ds_list_size(newList)-1)
				furtherstObj.image_blend=c_red
				furtherstObj.roomType= 1
				}
		}else{
			i--
		}
}

	image_angle=0
	sprite_index=sprite
	mask_index=image_index
	image_yscale=4.5
	image_xscale=4.5
	
	var instances = ds_list_create() //the instances nearby a selected object when it checks for sidepaths
	
	
	

#region sidepaths
	
	repeat(SidePaths){
	
	var obj1 = ds_list_find_value(nodesList,random(ds_list_size(nodesList)))

	image_angle=0
	sprite_index=sprite
	
	mask_index=sprite_index
	image_yscale=4.5
	image_xscale=4.5
	ds_list_clear(instances)
	instances = InstancePlaceList(obj1.x,obj1.y,obj_RoomNode)
	show_debug_message(ds_list_size(instances))
	
for (var c = 0; c< ds_list_size(instances);c++){
	
		
		var obj2 = ds_list_find_value(instances,c)
		
		
		
		#region layer 2
		
		var existsAlready = 0
		var noLineOfSight = 0
		var raycheck = 0

	for (var arr = 0; arr < array_height_2d(nodesArray); arr++){
		var objA = nodesArray[arr,0]
		var objB = nodesArray[arr,1]
		

		var offset = 20 //minDist
		var angle1 = point_direction(obj1.x,obj1.y,obj2.x,obj2.y)
		var angle2 = point_direction(objA.x,objA.y,objB.x,objB.y)
		
		var offset1x = lengthdir_x(offset,angle1)
		var offset1y = lengthdir_y(offset,angle1)
		var offset2x = lengthdir_x(offset,angle2)
		var offset2y = lengthdir_y(offset,angle2)
		
		var x1 = obj1.x + offset1x
		var y1 = obj1.y + offset1y
		var x2 = obj2.x - offset1x
		var y2 = obj2.y - offset1y
		var x3 = objA.x + offset2x
		var y3 = objA.y + offset2y
		var x4 = objB.x - offset2x
		var y4 = objB.y - offset2y

		
		
		
		var vec = LinesIntersect(x1,y1,x2,y2,x3,y3,x4,y4,true)
		if (vec!=0){
		var intx = obj1.x + vec * (obj2.x - obj1.x)
		var inty = obj1.y + vec * (obj2.y - obj1.y)
			noLineOfSight=1
			
		}
		
		if ((objA==obj1&&objB==obj2)||(objA==obj2&&objB==objA)){
			existsAlready=1	
		}
		
		#region raycast
		
				
			var xv = lengthdir_x(dist/2,angle1) + obj1.x
			var yv = lengthdir_y(dist/2,angle1) + obj1.y

			#region contained
			var distance = point_distance(obj1.x,obj1.y,obj2.x,obj2.y)
			var tempInst = instance_create_depth(obj1.x,obj1.y,0,obj_temp)
			tempInst.host = id
			tempInst.sprite_index = spr_laser
			tempInst.image_yscale = distance/sprite_get_height(spr_laser)
			tempInst.image_angle = angle1-90
			tempInst.image_xscale=2
			tempInst.obj1 = obj1
			tempInst.obj2 = obj2
			
			with (tempInst){
				checkers=0
				test = ds_list_create()
				instance_place_list(x,y,obj_RoomNode,test,true)
				show_debug_message(test)
				
				if ds_list_size(test)>0{
					show_debug_message("fat"+string(ds_list_size(test)))
					for(var d = 0; d< ds_list_size(test);d++){
						var targ = ds_list_find_value(test,d)	
						if targ!=obj1&&targ!=obj2{
							checkers=1
							break;
						}
					}

				
			}
			ds_list_destroy(test)
			}
			
			raycheck=tempInst.checkers
			
			#endregion
			

		#endregion
		
		
		
	}

	if obj1!=obj2&&existsAlready==0&&noLineOfSight==0&&raycheck=0{
		var current = array_height_2d(nodesArray)
		nodesArray[current,0] = obj1
		nodesArray[current,1] = obj2
		break;
	}else{
	//loops--	
	}
		
		#endregion
		
}

}

ds_list_destroy(instances)
#endregion

/*
//place rooms
ds_list_shuffle(nodesList)
var roomSets = ds_list_create()

var roomset = ds_list_create()



ds_list_add(roomSets, roomset)

roomsA[| 0] = 2;
roomsA[| 1] = 3;
roomsA[| 2] = 4;

roomsB[| 0] = 5;
roomsB[| 1] = 6;
roomsB[| 2] = 7;
var roomsC = ds_list_create()
roomsC[| 0] = 8;
roomsC[| 1] = 9;
roomsC[| 2] = 10;
//determines the number of each subset of rooms to include
var maxRoomsA = 2
var maxRoomsB = 3
var maxRoomsC = 4
//determines if multiple of a room subset can exist
var roomsARepeat = 0
var roomsBRepeat = 0
var roomsCRepeat = 1
//determines if room subsets will always have every max room posible put in the room, going in order of A to B to C
var totalRequestedRooms = maxRoomsA+maxRoomsB+maxRoomsC
*/

#region old alt paths
/*

var looped = 0
for (var a = 0; a < 40; a++){
	
	//var obj1 = ds_list_find_value(nodesList,random(ds_list_size(nodesList)))
	if looped==ds_list_size(nodesList){break;}
	var obj1 = ds_list_find_value(nodesList,looped)
	image_angle=0
	mask_index=image_index
	image_yscale=50
	image_xscale=50
	
	var instances = ds_list_create()
	instances = InstancePlaceList(obj1.x,obj1.y,obj_RoomNode)
	
	
	//show_debug_message(ds_list_size(instances))
	
for (var c = 0; c< ds_list_size(instances);c++){
		
		var obj2 = ds_list_find_value(instances,c)
		var intersect = 0
		for (var b = 0; b < ds_list_size(nodesList)-1+sidepaths; b++){
			var objA = nodesArray[b,0]
			var objB = nodesArray[b,1]
			var check = ((obj1 == objA && obj2 == objB) || (obj1 == objB && obj2 == objA))
			if LinesIntersect(obj1.x,obj1.y,obj2.x,obj2.y,objA.x,objA.y,objB.x,objB.y,true)!=0||check==1{
				//intersect=1
				//show_debug_message("B"+string(b))
				break;
			}
			//if b == ds_list_size(nodesList)-1+sidepaths{intersect=1}
		}	
	
	if obj1==obj2||intersect==1{
		a--	
	}else{
		nodesArray[ds_list_size(nodesList)-1+a,0] = obj1
		nodesArray[ds_list_size(nodesList)-1+a,1] = obj2
		sidepaths++
		//show_debug_message("made at "+string(looped))
		show_debug_message("obj1:"+string(obj1)+"obj2:"+string(obj2))
		break;
	}
	
	
}
	//var obj2 = ds_list_find_value(nodesList,random(ds_list_size(nodesList)))
			
	looped++
	if looped=9000{break;}
}
		*/
#endregion


