randomize()

sprite = sp_roomHitbox
raycast_sprite = sp_roomRaycaster
//RoomType key

//room 0 = entrance
//room 1 = exit
//room 2 = limited
//room 3 = unlimited


var w = 0
var h = 0

//ws[1]=0
//hs[1]=0


MainRooms = 10
SidePaths = 4

pathWidth = 600

wallPaths[1,1] = 0
pathPairs = 0

obj_player.x = x
obj_player.y = y


num = 0

nodesArray[0,0]=0
//nodes array is fomatted with [x,0] being the origin object and [x,1] being the object the line is drawn to



#region first node, needs to be cleaned up a lot

nodesList = ds_list_create()

		var fname = "testRoomPrefab_1"
		var inputFile=file_text_open_read_ns(fname,65001) 
			var inputData = string_load_ns(inputFile)
		file_text_close_ns(inputFile)
		//THIS ONLY WORKS ON WINDOWS, TO MY KNOWLEGE, MIGHT NEED TO LOOK HOW THE UN-SANDBOXER WORKS
		
		var templist = ds_list_create()
		ds_list_read(templist,inputData)
		
		w = ds_list_find_value(templist,1)
		h = ds_list_find_value(templist,2)

		var roomString = ds_list_find_value(templist,0)
																	//create first node
var inst = instance_create_depth(x,y,0,obj_RoomNode) //CHANGE THIS TO WORK WITH W AND H AND THE FILE FORMAT
inst.num = num++
ds_list_add(nodesList,inst)
inst.image_blend=c_blue
inst.roomType = 0
inst.breakObjs = ds_list_create()
inst.sprite_index = sp_onePixel
			inst.image_xscale = w
			inst.image_yscale = h
			inst.w =w
			inst.h =h
			with(inst){
				var corner1 =instance_create_depth(x+w/2,y+h/2,0,obj_breakstend)
				var corner2 = instance_create_depth(x+w/2,y-h/2,0,obj_breakstend)
				var corner3 = instance_create_depth(x-w/2,y-h/2,0,obj_breakstend)
				var corner4 = instance_create_depth(x-w/2,y+h/2,0,obj_breakstend)
				
				ds_list_add(inst.breakObjs,corner1 )
				ds_list_add(inst.breakObjs,corner2 )
				ds_list_add(inst.breakObjs,corner3 )
				ds_list_add(inst.breakObjs,corner4 )
			}	


SpawnPrefabFromString(roomString,inst.x,inst.y)

ds_list_destroy(templist)

#endregion

var checkInst = instance_create_depth(x,y,0,obj_temp_2)
for (var i = 0; i<MainRooms; i++){//loops until every room requrested in the mainrooms var is created sucessfully
	
		
		
		var fname = ""
		switch(0/*some random function here*/){ //load room file
		
	case 0: //start
		fname = "testRoomPrefab_1"//CreatePrefabFileName("testRoomPrefab_",1)
	
		
	break;
	case 1: //exit
	//	SpawnPrefab(CreatePrefabFileName("testRoomPrefab_",2),nodeObj.x,nodeObj.y)
	break;
	case 2: //limited  WIP
	break;
	case 3: //unlimited WIP
	//	SpawnPrefab(CreatePrefabFileName("testRoomPrefab_",3),nodeObj.x,nodeObj.y)
	break;
	}
		//load data about specific room and set room specific variables
		//var file = file_text_open_read(fname)
		//	var inputData = file_text_read_string(file)
		//file_text_close(file)
		var inputFile=file_text_open_read_ns(fname,65001) 
			var inputData = string_load_ns(inputFile)
		file_text_close_ns(inputFile)
		//THIS ONLY WORKS ON WINDOWS, TO MY KNOWLEGE, MIGHT NEED TO LOOK HOW THE UN-SANDBOXER WORKS
		
		var templist = ds_list_create()
		ds_list_read(templist,inputData)
		//show_message(ds_list_find_value(templist,0))
		
		w = ds_list_find_value(templist,1)
		h = ds_list_find_value(templist,2)
		
		//show_message(ds_list_size(templist))

		var roomString = ds_list_find_value(templist,0)
		
		ds_list_destroy(templist)
		
		var minDist =  2000 //w*h//sqrt((h*h)+(w*w))
		var maxDist =  minDist
		mask_index = sp_onePixel
		image_xscale = w
		image_yscale = h
		
		
		
		//set random position variables
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
		
		var checks = 0
		
		for (var a = 0; a < ds_list_size(nodesList)-1; a++){//collision checks w other rooms
			checks++
			show_debug_message(checks)
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
			//check for nearby objects with a raycast
			#region wide raycast
			var distance = point_distance(obj1.x,obj1.y,obj2.x,obj2.y)
			var tempInst = instance_create_depth(obj1.x,obj1.y,0,obj_temp)
			var angle1 = point_direction(obj1.x,obj1.y,obj2.x,obj2.y)
			tempInst.host = obj1
			tempInst.sprite_index = raycast_sprite
			tempInst.image_yscale = distance/sprite_get_height(raycast_sprite)
			tempInst.image_angle = angle1-90
			tempInst.image_xscale = 1
			
			//colision check
			with (tempInst){
				checkers=0
				searchingNodes = ds_list_create()
				instance_place_list(x,y,obj_RoomNode,searchingNodes,true)
				
				if ds_list_size(searchingNodes)>0{
					for(var d = 0; d< ds_list_size(searchingNodes);d++){
						var targ = ds_list_find_value(searchingNodes,d)	//checks if an object found is not the origin obj
						if targ==checkInst{
							show_debug_message(ds_list_size(obj_PointGen.nodesList))
							checkers=1
							break;
						}
					}

				
			}
			ds_list_destroy(searchingNodes)
			}
			
			
			if (tempInst.checkers!=0){//pass the flag to this object
				intersect =1	
				break;
			}
			#endregion
		}
		
		
		
		
		
		var obj = instance_nearest(xpos,ypos,obj_RoomNode)
		var distBetween = point_distance(xpos,ypos,obj.x,obj.y)
		
		
		
		if !instance_place(xpos,ypos,obj_RoomNode)&&intersect==0&&distBetween>minDist{//create new room if possible, otherwise loop
			
			var newObj = instance_create_depth(xpos,ypos,0,obj_RoomNode)
			newObj.num = num ++
			newObj.roomType = 3
			nodesArray[startingSize,0] = target
			nodesArray[startingSize,1] = newObj
			ds_list_add(nodesList,newObj)
			newObj.sprite_index = sp_onePixel
			newObj.image_xscale = w
			newObj.image_yscale = h
			
			newObj.w =w
			newObj.h =h
			newObj.breakObjs = ds_list_create()
			with(newObj){ 
				var corner1 =instance_create_depth(x+w/2,y+h/2,0,obj_breakstend)
				var corner2 = instance_create_depth(x+w/2,y-h/2,0,obj_breakstend)
				var corner3 = instance_create_depth(x-w/2,y-h/2,0,obj_breakstend)
				var corner4 = instance_create_depth(x-w/2,y+h/2,0,obj_breakstend)
				
				ds_list_add(newObj.breakObjs,corner1 )
				ds_list_add(newObj.breakObjs,corner2 )
				ds_list_add(newObj.breakObjs,corner3 )
				ds_list_add(newObj.breakObjs,corner4 )
			}	

			
			if i == MainRooms -1 {//check if exit room
				var firstObj = ds_list_find_value(nodesList,0)
				var newList = ds_list_create()
				var furthestDist = 0
				var furthestIndex = 0;
				for(a = 0; a < ds_list_size(nodesList);a++){//cycle all room nodes to find the furthest
					var someNode = ds_list_find_value(nodesList,a)
					var farDist = point_distance(firstObj.x,firstObj.y,someNode.x,someNode.y)
					if farDist > furthestDist {
						furthestDist = farDist
						furthestIndex = a
					}
				}
				
				var furtherstObj = ds_list_find_value(nodesList,furthestIndex)

				//instance_place_list(firstObj.x,firstObj.y,obj_RoomNode,newList,true)
				//var furtherstObj = ds_list_find_value(newList,ds_list_size(newList)-1)
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
			tempInst.sprite_index = raycast_sprite
			tempInst.image_yscale = distance/sprite_get_height(raycast_sprite)
			tempInst.image_angle = angle1-90
			tempInst.image_xscale=1
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




//shuffledNodes = ds_list_create()
//ds_list_copy(shuffledNodes,nodesList)
//ds_list_shuffle(shuffledNodes)

for(var node = 0; node< ds_list_size(nodesList); node++){
	var nodeObj = ds_list_find_value(nodesList,node)
	
	// SPAWN THE ROOM PREFAB HERE
	SpawnPrefabFromString(roomString,nodeObj.x,nodeObj.y)
	
	var float = instance_create_depth(nodeObj.x,nodeObj.y,0,floatingNumber)
	float.num = nodeObj.num
}


//remove outer walls


for (var a = 0; a < array_height_2d(nodesArray); a++){
var obj1 = nodesArray[a,0]
var obj2 = nodesArray[a,1]


	#region wide raycast
	show_debug_message(string(w)+" "+string(h))
			var distance = point_distance(obj1.x,obj1.y,obj2.x,obj2.y)
			var tempInst = instance_create_depth(obj1.x,obj1.y,0,obj_temp)
			var angle1 = point_direction(obj1.x,obj1.y,obj2.x,obj2.y)
			tempInst.host = obj1
			tempInst.sprite_index = raycast_sprite
			tempInst.image_yscale = distance/sprite_get_height(raycast_sprite)
			tempInst.image_angle = angle1-90
			tempInst.image_xscale= pathWidth/sprite_get_width(raycast_sprite)
			tempInst.image_blend = c_red
			tempInst.depth = -100000000
			
				//																		ADD OBJECT PARENTS FOR BREAKSTARTS AND BREAKENDS !!!!!!!!
				//																			I did that
				
				//obj1 
				var pointx = lengthdir_x(tempInst.sprite_width/2,angle1-90)//right
				var pointy = lengthdir_y(tempInst.sprite_width/2,angle1-90)
				var out = RectangleGetAnglePoint(pointx,pointy,angle1,w/2,h/2)
				var obj1a = instance_create_depth(out[0]+obj1.x,out[1]+obj1.y,-40,obj_breakend)
				ds_list_add(obj1.breakObjs,obj1a)

				//obj1
				var pointx = lengthdir_x(tempInst.sprite_width/2,angle1+90)//left
				var pointy = lengthdir_y(tempInst.sprite_width/2,angle1+90)
				var out = RectangleGetAnglePoint(pointx,pointy,angle1,w/2,h/2)
				var obj1b = instance_create_depth(out[0]+obj1.x,out[1]+obj1.y,-40,obj_breakstart)
				ds_list_add(obj1.breakObjs,obj1b)

				
				//obj2
				var pointx = lengthdir_x(tempInst.sprite_width/2,angle1-90)
				var pointy = lengthdir_y(tempInst.sprite_width/2,angle1-90)
				var out = RectangleGetAnglePoint(pointx,pointy,angle1,w/2,h/2)
				var obj2a = instance_create_depth(-out[0]+obj2.x,-out[1]+obj2.y,-40,obj_breakend)
				ds_list_add(obj2.breakObjs,obj2a)

				//obj2
				var pointx = lengthdir_x(tempInst.sprite_width/2,angle1+90)
				var pointy = lengthdir_y(tempInst.sprite_width/2,angle1+90)
				var out = RectangleGetAnglePoint(pointx,pointy,angle1,w/2,h/2)
				var obj2b = instance_create_depth(-out[0]+obj2.x,-out[1]+obj2.y,-40,obj_breakstart)
				ds_list_add(obj2.breakObjs,obj2b)

				wallPaths[pathPairs,0] = obj1a
				wallPaths[pathPairs,1] = obj2b
				pathPairs++
				wallPaths[pathPairs,0] = obj2a
				wallPaths[pathPairs,1] = obj1b
				pathPairs++
			//colision check
			with (tempInst){
				searchingWalls = ds_list_create()
				instance_place_list(x,y,obj_outerWallObjstacle,searchingWalls,true)
				
					while ds_list_size(searchingWalls)>0{
						var targ = ds_list_find_value(searchingWalls,0)	
						instance_destroy(targ)
						ds_list_delete(searchingWalls,0)
					}

			ds_list_destroy(searchingWalls)
			}
			
	#endregion

}

//SELECTION SORT THE LIST BASED ON ROTATION FROM ROOM ORIGIN, SLOT 0 MUST HAVE A BREAKEND

var node;
var obj;
var thisNode;
var thisList;
var currentObj;

for( var node = 0; node < ds_list_size(nodesList);node++;){//loop nodes
	 thisNode = ds_list_find_value(nodesList,node)
	 thisList = thisNode.breakObjs
	for( obj = 0; obj < ds_list_size(thisList);obj++){//loop objects to set rotation
		 currentObj = ds_list_find_value(thisList,obj)
		currentObj.angle = point_direction(thisNode.x,thisNode.y,currentObj.x,currentObj.y)
		show_debug_message(currentObj.angle)
	}
	
	thisNode.sortedBreakObjs = ds_list_create()
	while( ds_list_size(thisList)>0){//selection sort based on rotation
		show_debug_message(ds_list_size(thisList))
		var highestIndex = 0
		
		for( obj = 0; obj< ds_list_size(thisList);obj++;){
			var thisAngle = ds_list_find_value(thisList,obj).angle
			var newhighest = ds_list_find_value(thisList,highestIndex)
			
			//find why shit gets wacky here, but more importantly find why sometimes nodes don't get lists 
			
			show_debug_message(thisAngle)
			//show_debug_message(lowestIndex)
			//show_debug_message(newLowest)
			//show_debug_message(newLowest.angle)
			var currenthighest = newhighest.angle
			if thisAngle>currenthighest{
			highestIndex=obj	
			}
		}
		ds_list_add(thisNode.sortedBreakObjs,ds_list_find_value(thisList,highestIndex))//move and delete 
		ds_list_delete(thisList,highestIndex)

		if ds_list_size(thisList) == 0 {
		break;	
		}
	}
	ds_list_copy(thisNode.breakObjs,thisNode.sortedBreakObjs)
	ds_list_destroy(thisNode.sortedBreakObjs)


	while( object_get_name(ds_list_find_value(thisNode.breakObjs,0).object_index) != "obj_breakend" ){ // keep shifting list until it starts with a breakend
		//show_debug_message(object_get_name(ds_list_find_value(thisNode.breakObjs,0)))
		thisNode.shifted = ds_list_create()
		
		for(i = 1; i < ds_list_size(thisNode.breakObjs) ; i++;){
			
			ds_list_add(thisNode.shifted,ds_list_find_value(thisNode.breakObjs,i))
			
			if (i == ds_list_size(thisNode.breakObjs) - 1) {
				ds_list_add(thisNode.shifted,ds_list_find_value(thisNode.breakObjs,0))
			}
		
		}
	ds_list_copy(thisNode.breakObjs,thisNode.shifted)
	ds_list_destroy(thisNode.shifted)
	}
}

//SETTING WALLS
var thisNode;
var thisList;
var currentObj;
var stopSkippingFlag =0;
var wallPairs;
for(var node = 0; node< ds_list_size(nodesList);node++){
	
	thisNode = ds_list_find_value(nodesList,node)
	thisList = thisNode.breakObjs
	thisNode.walls[1,1] = 0 
	wallPairs = 0
	stopSkippingFlag=0
	var point = 0

	for(var obj = 0; obj < ds_list_size(thisList);obj++){
		currentObj = ds_list_find_value(thisList,obj)
		show_debug_message(string(obj)+":			"+string(object_get_name(currentObj.object_index)))
		thisNode.walls[wallPairs,point % 2] = currentObj
		show_debug_message("A"+string(wallPairs)+string(point%2))
		if (point % 2)==1 {wallPairs++}
		
		switch(currentObj.object_index){
			case obj_breakstart:
			case obj_breakend:
			point++
			break;
			case obj_breakstend:
			
			if (point % 2)==1 {
				point++
				thisNode.walls[wallPairs,(point) % 2] = currentObj
				show_debug_message("B"+string(wallPairs)+string(point%2))//works
				point++
			} else {
				point++
				thisNode.walls[wallPairs,(point) % 2] = currentObj
				show_debug_message("C"+string(wallPairs)+string(point%2))//doesnt work post
				wallPairs++
				point++
			}
			
			break;
		}
		
			
		
	}
	thisNode.wallPairs = wallPairs
}





//instance_destroy(tempInst)	


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



