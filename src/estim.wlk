import temporadaDescuentos.*

object estim {
	const juegos=[]
	
	method agregarJuego(unJuego){
		juegos.add(unJuego)
	}
	method agregarJuegos(coleccionJuegos){
		juegos.addAll(coleccionJuegos)
	}
	method quitarJuego(unJuego){
		juegos.remove(unJuego)
	}
	method aplicarDescuento(unJuego,unDescuento){
		unJuego.descuento(unDescuento)
	}
	method quitarDescuento(unJuego){
		unJuego.descuento(0)
	}
	method aplicarDescuentoDirectoACasiMasCaros(cantidad){
		if (cantidad>100){
			self.error("no se puede aplicar un descuento mayor a 100")
		}
		else{
			self.casiLosMasCaros().forEach({j=>self.aplicarDescuento(j,new DescuentoDirecto(cantidadDeDescuento=cantidad))})
		}
	}
	method casiLosMasCaros(){
		return juegos.filter({j=>j.superaTresCuartos(self.elMasCaro().precioConDescuento())})
	}
	method elMasCaro(){
		return juegos.max({j=>j.precioConDescuento()})
	}
	method juegosParaMenoresDe(unPais){
		return juegos.filter({j=>j.esAptoParaMenoresDe(unPais)})
	}
	method promedioDePrecioParaMenores(unPais){
		return self.sumaDePrecioDeJuegosParaMenoresDe(unPais)/self.cantidadDeJuegosParaMenoresDe(unPais)
	}
	method sumaDePrecioDeJuegosParaMenoresDe(unPais){
		return self.juegosParaMenoresDe(unPais).sum({j=>j.conversionDePrecioA(unPais)})
	}
	method cantidadDeJuegosParaMenoresDe(unPais){
		return self.juegosParaMenoresDe(unPais).size()
	}
	method hayJuegoGalardonado(){
		return juegos.any({j=>j.esGalardonado()})
	}
}






