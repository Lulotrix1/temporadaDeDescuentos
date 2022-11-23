class Critica{
	const texto
	const property esPositiva
	
	method tieneTextoMayorA(cantidad){
		return texto.size()>cantidad
	}
}

class Critico{
	
	method estaPositivo(unJuego)
	
	method escribirCritica(unJuego){
		if(self.estaPositivo(unJuego)){
			self.escribirCriticaPositivaA(unJuego)		
		}
		else{
			self.escribirCriticaNegativaA(unJuego)	
		}		
	}
	method escribirCriticaPositivaA(unJuego){
		unJuego.recibirCritica(new Critica(texto=self.textoPositivo(),esPositiva=true))
	}
	method escribirCriticaNegativaA(unJuego){
		unJuego.recibirCritica(new Critica(texto=self.textoNegativo(),esPositiva=false))
	}
	//la herencia se utiliza para heredar los metodos de critica,
	//ya que todos critican tanto positivamente como negativamente y
	//tienen un estado positivo o negativo.
	
	method textoPositivo()
	method textoNegativo()
	//los metodos abstractos evitan que se instancie la clase Critico, y son definidos
	//en las respectivas subclases.
}


class Usuario inherits Critico{
	 var estaPositivo
	
	override method estaPositivo(unJuego){
		return estaPositivo
	}	
	override method textoPositivo(){
		return "si"
	}
	override method textoNegativo(){
		return "no"
	}
}

class CriticosPagos inherits Critico{
	const juegosQueLePagaron=[]
	
	method recibirPagoDeJuego(unJuego){
		juegosQueLePagaron.add(unJuego)
	}
	override method estaPositivo(unJuego){
		return juegosQueLePagaron.contains(unJuego)
	} 
	override method textoPositivo(){
		return"Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
			   sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"
	}
	override method textoNegativo(){
		return "Ut enim ad minim veniam, quis nostrud exercitation 
			    ullamco laboris nisi ut aliquip ex ea commodo consequat"
	}
}
class Revista inherits Critico{
	const criticos=[]
	
	override method estaPositivo(unJuego){
		return self.cantidadDeCriticosPositivos(unJuego)>criticos.size()/2
	}
	method cantidadDeCriticosPositivos(unJuego){
		return criticos.count({c=>c.estaPositivo(unJuego)})
	}
	override method textoPositivo(){
		return criticos.sum({c=>c.textoPositivo()})
	}
	override method textoNegativo(){
		return criticos.sum({c=>c.textoNegativo()})
	}
	method perderCritico(unCritico){
		criticos.remove(unCritico)
	}
	method incorporarCritico(unCritico){
		criticos.add(unCritico)
	}
}







