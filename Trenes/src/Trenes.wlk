/**
	Pensar mejor como interactuan los objetos entre sí, está toda la responsabilidad en el Depósito. Hay que pensar mas en objetos menos en estructurado

	El ejercicio implica VagonesDePasajeros, VagonesDeCarga, Locomotora, Deposito. Pensar como modelar estás entidades y que responsabilidad le toca a cada una.
	
	No concentrarse tanto en resolver los algoritmos sino en el diseño, en como conviene que se "hablen" los objetos entre sí, si el diseño está bien la solución se vuelve simple.

	No hay un solo test. Hacer tests!
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
	

	//Pregunta 1  
	method numLightPasWagon () {
	/**
	 El razonamiento parece correcto, tratar de pasar esto a bloques (closures) sin usar el for,
	 apoyarse en el ejercicio de mensajeros y en la documentación de la paǵina
	*/
		for (i = 0, i < numLightWagon, i++){
			if(pasWagonWeight < 2500 && locoActualWeight < 12000){
				numLightWagon ++
			}
		}return numLightWagon	
	}
	//Fin Pregunta 1
	
	//Pregunta 2
	method maxSpeed () {
		// Ojo acá formation no entiende el mensaje loco (que es loco??) y speed no es una property o método y no te va a dejar accederla y además no resuelve lo pedido
		formation.loco.speed.min  
		/*
		 * la formacion debe poder devolver su velocidad máxima que depende de la velocidad máxima mas baja de las locomotoras que compongan a esa formación, algo como:
		 * Sí la formación tiene una lista de locomotoras
		 * locomotoras.min({locomotora => locomotora.velocidaMaxima()})
		 */
		
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
	speed = locoSpeed  // si quisiera que esta variable sea accesible por otro objeto lo hago con una property o hago un método que me devuelva su valor, y locoSpeed no es un valor
	
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

