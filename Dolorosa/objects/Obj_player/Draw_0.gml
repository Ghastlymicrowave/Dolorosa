
if attackingframes =0{
sprite_index=sp_badplayer//default



//if atk=1 then sprite_index=sp_badplayeratk//warmup

} 
if atktimeheld= heavyAtkTimeThreshold  then sprite_index = sp_badplayerheavyready//heavy ready
attackingframes--


draw_self()

draw_line(x,y,x+lengthdir_x(300,direction),y+lengthdir_y(300,direction))
