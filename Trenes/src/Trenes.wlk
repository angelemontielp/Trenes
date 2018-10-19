/**
	Va bien hay que pensar mejor como interactuan los objetos entre si, está toda la responsabilidad en el depósito. Hay que pensar mas en objetos menos en estructurado

	El ejercicio implica VagonesDePasajeros, VagonesDeCarga, Locomotoras, Deposito. Pensar como modelar estás entidades y que responsabilidad le toca a cada una.

	No Hay un solo test. Hacer tests!
 */

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
	

	//Pregunta 1  // El razonamiento parece correcto, tratar de pasar esto a bloques (closures) sin usar el for, apoyarse en el ejercicio de mensajeros
	// en la documentación de la paǵina
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
		formation.loco.speed.min  // Ojo acá formation no entiende el mensaje loco y speed no es una property o método y no te va a dejar accederla
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
	speed = locoSpeed  // si quisiera que esta variable sea accesible por otro objeto lo hago una property o hago un método que me devuelva su valor y locoSpeed no es un valor
	
	/**
		var property speed

		ó

		method speed(){
			return speed		
		}
	 */
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

