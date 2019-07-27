
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



var higher= aimdir+(aimspread * aimpercentage)
var lower= aimdir-(aimspread * aimpercentage)

draw_line(x,y,x+lengthdir_x(1000,higher),y+lengthdir_y(1000,higher))
draw_line(x,y,x+lengthdir_x(1000,lower),y+lengthdir_y(1000,lower))

var anglerange = abs(angle_difference(lower,higher))
while anglerange>0{
	draw_set_color(c_blue)
draw_line(x,y,x+lengthdir_x(1000,lower+anglerange),y+lengthdir_y(1000,lower+anglerange))

anglerange-=0.05
}



}