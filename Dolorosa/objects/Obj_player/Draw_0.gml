
if attackingframes =0{
sprite_index=sp_badplayer//default

if atktimeheld> heavyAtkTimeThreshold then sprite_index = sp_badplayerheavyready//heavy ready

if atk=1 then sprite_index=sp_badplayeratk//warmup

} 
attackingframes--


draw_self()