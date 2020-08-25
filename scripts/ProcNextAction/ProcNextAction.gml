function ProcNextAction() {
	var proc = 0
	if roll { nextaction=actions.roll;proc = 1}
	if backstep { nextaction=actions.backstep;proc = 1}
	if lightAttack {nextaction = actions.light;proc = 1}
	if heavyAttack {nextaction = actions.heavy;proc = 1}


	if proc { nextActionTime=nextActionTimeframe}


}
