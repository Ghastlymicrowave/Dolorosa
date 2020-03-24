var num = string(argument0)
if string_letters(num)<2{
num = "0"+num	
}
return asset_get_index("obj_pHitbox"+num)