
if attackingframes =0{
sprite_index=sp_badplayer//default



//if atk=1 then sprite_index=sp_badplayeratk//warmup

} 
if atktimeheld= heavyAtkTimeThreshold  then sprite_index = sp_badplayerheavyready//heavy ready
attackingframes--


draw_self()
draw_set_color(c_red)
draw_line(x,y,x+lengthdir_x(300,direction),y+lengthdir_y(300,direction))
draw_set_color(c_white)
draw_line(x,y,x+lengthdir_x(300,lastdir),y+lengthdir_y(300,lastdir))

if wielding=1{
if atktimeheld=0{ var aimpercentage = 1} else var aimpercentage = (aimtime-atktimeheld)/aimtime

show_debug_message(string(aimdir))
smoothAimDir+=angle_difference(aimdir,smoothAimDir)/2

aimrange+= ((((aimspread+max(spd,0)/2)/2) * aimpercentage+((baseaimspread+max(spd,0))/2))- aimrange)/2

var high= smoothAimDir+aimrange
var low= smoothAimDir-aimrange


draw_line(x,y,x+lengthdir_x(1000,high),y+lengthdir_y(1000,high))
draw_line(x,y,x+lengthdir_x(1000,low),y+lengthdir_y(1000,low))

var anglerange = abs(angle_difference(low,high))
while anglerange>0{
	draw_set_color(c_blue)
draw_line(x,y,x+lengthdir_x(1000,low+anglerange),y+lengthdir_y(1000,low+anglerange))

anglerange-=0.05
}



}