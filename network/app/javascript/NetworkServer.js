function toggleArticulos(element) 
{
    var redContenido = element.querySelector('.redContenido');
    if (redContenido.style.display === 'none' || redContenido.style.display === '') 
    {
      redContenido.style.display = 'block';
    } 
    else 
    {
      redContenido.style.display = 'none';
    }
}

function mostrarInformacion(contenedor) {
  var informacionOculta = contenedor.querySelector('#informacionOculta').innerHTML;
  var informacionTarjeta = document.getElementById('informacionTarjeta');
  var informacionActual = contenedor.innerHTML;
  
  // Agregar la información básica de la tarjeta actual
  informacionTarjeta.innerHTML = informacionActual;

  // Mostrar la información oculta del equipo actual
  informacionTarjeta.innerHTML += informacionOculta;
  
  informacionTarjeta.style.display = 'block';
}

function ocultarInformacion() {
  var informacionTarjeta = document.getElementById('informacionTarjeta');
  informacionTarjeta.style.display = 'none';
}