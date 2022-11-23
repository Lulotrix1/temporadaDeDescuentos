import criticos.*

class Juego{
	const property precioDolar
	const caracteristicas =[]
	var property descuento=new DescuentoDirecto(cantidadDeDescuento=0)
	const criticas=[]
	
	
	method precioConDescuento(){
		return descuento.aplicado(precioDolar)
	}	
	method superaTresCuartos(unPrecio){
		return self.precioConDescuento()>unPrecio*0.75 and self.precioConDescuento()<unPrecio
	}	
	
	method agregarCaracteristicas(unaColeccion){
		caracteristicas.addAll(unaColeccion)
	}
	method esAptoParaMenoresDe(unPais){
		return not caracteristicas.any({c=>unPais.prohibe(c)})
	}
	method conversionDePrecioA(unPais){
		return self.precioDolar()*unPais.conversion()
	}
	method recibirCritica(unaCritica){
		criticas.add(unaCritica)
	}
	method cantidadDeCriticasPositivasMayorA(cantidad){
		return self.cantidadDeCriticasPositivas()>cantidad
	}
	method cantidadDeCriticasPositivas(){
		return criticas.count({c=>c.esPositiva()})
	}
	method esGalardonado(){
		return criticas.all({c=>c.esPositiva()})
	}
	method tieneCriticosLiterarios(){
		return criticas.any({c=>c.tieneTextoMayorA(100)})
	}
}

class DescuentoDirecto{
	const cantidadDeDescuento
	
	 	
	method aplicado(unPrecio){
		return (unPrecio-(cantidadDeDescuento*unPrecio)/100)
	}
}

class DescuentoFijo inherits DescuentoDirecto{
	override method aplicado(unPrecio){
		return (unPrecio/2).max(unPrecio-cantidadDeDescuento)
	}
}
class DescuentoTotal inherits DescuentoDirecto{
	override method aplicado(unPrecio){
		return 0
	}
}
class DescuentoTacanio inherits DescuentoDirecto{
	override method aplicado(unPrecio){
		return (unPrecio*(30/100)).min(super(unPrecio))
	}
}

class Pais{
	const property conversion
	const property legislacion=[]
 	
 	method prohibe(unaCaracteristica){
 		return legislacion.contains(unaCaracteristica)
 	}
 	method agregarProhibiciones(unaColeccion){
 		legislacion.addAll(unaColeccion)
 	}
}

object contenidoViolento{}
object lenguajeInapropiado{}
object contenidoAdulto{}









