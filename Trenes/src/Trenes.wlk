

class Deposito {
	
	//integers
	var property wagonLong
	var property wagonWide
	var property maxLoad
	var property numPas
	var property loadActualWagonWeight
	var property pasWagonWeight
	var property loadMaxWagonWeight
	var property locoActualWeight
	var property locoSpeed

	var property utilDrag
	var property formationWeightLoad
	var property formationWeightPas
	
	//booleans
	var property isEfficient
	var property canMove
	var property needExpert
	
	//Pregunta 1
	var property numLightWagon
	var property i
	//Pregunta 1
	
	//Pregunta 5
	var property pullKg
	//Pregunta 5
	
	//Pregunta 6
	const wagonsMaxAdd = #{}
	//Pregunta 6
	

	method numPas () {
		if(wagonWide < 2.5){
			 numPas = wagonLong * 8
		}else if(wagonWide >= 2.5){
			 numPas = wagonLong * 10
		}	
	}
	
	method wagonWeight (){
		pasWagonWeight = numPas * 80
		loadActualWagonWeight = loadMaxWagonWeight + 160	
	}
	
	method utilDrag () {
		utilDrag = 12000 - locoActualWeight
	}
	
	method formationWeight () {
		formationWeightLoad = loadActualWagonWeight + locoActualWeight
		formationWeightPas = pasWagonWeight + locoActualWeight
	}
	
	//Pregunta 1
	method numLightPasWagon () {
		for (i = 0, i < numLightWagon, i++){
			if(pasWagonWeight < 2500 && locoActualWeight < 12000){
				numLightWagon ++
			}
		}return numLightWagon	
	}
	//Fin Pregunta 1
	
	//Pregunta 2
	method maxSpeed () {
		formation.loco.speed.min
	}
	//Fin Pregunta 2
	
	//Pregunta 3
	method isEfficient () {
		if(locoActualWeight > pasWagonWeight*5){
			isEfficient = true
		}else if (locoActualWeight > loadActualWagonWeight*5){
			isEfficient = true
		}else{
			isEfficient = false
		}
		
	}
	//Fin Pregunta 3
	
	//Pregunta 4
	
	method canMove (){
		if (utilDrag > formationWeightLoad){
			canMove = true
		}else if(utilDrag > formationWeightPas){
			canMove = true
		}else {
			canMove = false
		}
	}
	//Fin Pregunta 4
	
	//Pregunta 5
	method pullKg () {
		if (canMove == true){
			pullKg = 0
		}else {
			pullKg = loadActualWagonWeight + pasWagonWeight - utilDrag
		}
	}
	//Fin Pregunta 5
	
	//Pregunta 6
	method wagonsMaxAdd () {
		wagonsMaxAdd.add(formation.wagon.weightPas.max)
		wagonsMaxAdd.add(formation.wagon.pasWagonWeight.max)
	}
	//Fin Pregunta 6
	
	//Pregunta 7
	method needExpert() {
		if(formation.size > 20) {
			needExpert = true
		}else if ((formation.wagon.weightPas + formation.wagon.weightLoad + formation.loco.weightLoco) > 10000){
			needExpert = true
		}else{
			needExpert = false
		}
	}
	//Fin Pregunta 7
	
}


//Objetos

object wagon {
	weightPas = pasWagonWeight
	weightLoad = pasWagonWeight
}

object loco {
	weightLoco = locoActualWeight
	speed = locoSpeed
}

object formation {
	const formation = #{}
	method addWagons (wagon) {
		formation.add(wagon)
	}
	method addLoco (loco) {
		formation.add(loco)
	}
}

