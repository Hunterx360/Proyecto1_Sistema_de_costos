Algoritmo CalcularCostoProducto
    // Definimos las variables que usaremos
    Definir precioOriginal, precioConDescuento Como Real
	Definir precioConIva, precioConDescuentoCantidad Como Real
    Definir descuentoCupon, iva, descuentoCantidad, costoEnvio, costoFinal Como Real
    Definir cantidad, peso Como Entero
    Definir destino, tieneCupon Como Caracter
    Definir costoEnvioFijo, costoPorKg Como Real
	
    // Asignamos los Valores tomando como referencia los que aparecen en la guia
    iva <- 0.12 
    descuentoCantidad <- 0.05 
	costoPorKg <- 2 
    costoEnvioFijo <- 10 
     
	
    // Datos que se necesitan ingresar
    Escribir "Ingrese el precio original del producto: "
    Leer precioOriginal
    Escribir "Ingrese la cantidad de productos: "
    Leer cantidad
    Escribir "Ingrese el peso del paquete en kg: "
    Leer peso
    Escribir "Ingrese el destino del envío: "
    Leer destino
    Escribir "¿Tiene un cupón de descuento? (si/no): "
    Leer tieneCupon
	
    // Esto es por si la persona tiene el descuento pertinente
    Si tieneCupon = "si" Entonces
        Escribir "Ingrese el porcentaje de descuento del cupón (ej, 10 para 10%): "
        Leer descuentoCupon
        descuentoCupon <- descuentoCupon / 100 // lo convertimos a decimales para que sea del mismo formato de los otros
        precioConDescuento <- precioOriginal * (1 - descuentoCupon)
    Sino
        precioConDescuento <- precioOriginal
    FinSi
	
    // Aplicamos el iva que definimos anteriormente
    precioConIVA <- precioConDescuento * (1 + iva)
	
    // Aplicamos el descuento 
    Si cantidad > 1 Entonces
        precioConDescuentoCantidad <- precioConIVA * (1 - descuentoCantidad)
    Sino
        precioConDescuentoCantidad <- precioConIVA
    FinSi
	
    // Calculamos costo de envio
    costoEnvio <- costoEnvioFijo + (costoPorKg * peso)
	
    // Calculamos costo final del producto
    costoFinal <- (precioConDescuentoCantidad * cantidad) + costoEnvio
	
    // Mostramos el desglose de todo lo anterior
    Escribir "Desglose del costo final del producto:"
    Escribir "Precio original: $", precioOriginal
    Si tieneCupon = "si" Entonces
        Escribir "Descuento del cupón: $", precioOriginal * descuentoCupon
        Escribir "Precio con descuento del cupón: $", precioConDescuento
    FinSi
    Escribir "IVA: $", precioConDescuento * iva
    Escribir "Precio con IVA: $", precioConIVA
    Si cantidad > 1 Entonces
        Escribir "Descuento por cantidad: $", precioConIVA * descuentoCantidad
        Escribir "Precio total con descuento por cantidad: $", precioConDescuentoCantidad
    Sino
        Escribir "Precio total: $", precioConDescuentoCantidad
    FinSi
    Escribir "Costo de envío: $", costoEnvio
    Escribir "Costo final del producto: $", costoFinal
FinAlgoritmo
