var num = string(argument0)

if string_length(num)<2{
num = "0"+num	
}
var strOutput = "obj_pHitbox_"+num
return asset_get_index(strOutput)