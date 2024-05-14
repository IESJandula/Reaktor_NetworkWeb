require 'rest-client'
require 'json'
class MainController < ApplicationController
    def inicio
        urlBuscar = "http://localhost:8080/net/red/by/search"
        puts params
        
        ip = params[:selected_IP].present? ? params[:selected_IP] : "" # Si está presente, toma el valor, de lo contrario, toma una cadena vacía
        
        begin
            responseBuscar = RestClient.get(
            urlBuscar,
            params: { ip: ip } # Asegúrate de pasar el parámetro como parte de los parámetros de la solicitud
            ) 
            @redes = JSON.parse(responseBuscar.body)
            puts params[:selected_IP]
            puts @redes
            puts responseBuscar.code
        rescue RestClient::ExceptionWithResponse => e
            puts "Error: #{e.response}"
            @redes = [] # Si hay un error, asigna una lista vacía a @redes
        end
    end


    def borrar
        urlBorrar = "http://localhost:8080/net/red/deleteAllBefore"
        puts params

        if params[:borrar_desde].present?
            num_dias = params[:borrar_desde]
            begin
                responseBorrar = RestClient.post(
                    urlBorrar,
                    {numeroDiasString: num_dias}
                ) 
                puts responseBorrar.code
                
            rescue RestClient::ExceptionWithResponse => e
                puts "Error: #{e.response}"
            end
        else
            puts "No se realizo la petición, parametro vacio"
        end
    end
end