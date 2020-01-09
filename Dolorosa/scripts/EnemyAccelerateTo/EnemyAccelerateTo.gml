///@func EnemyAccelerateTo ( target speed, acceleration speed)
///@desc
///@arg target speed
///@arg acceleration rate

if spd<argument[0]{
spd+= (argument[0]-spd)/argument[1]
}