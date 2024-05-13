require 'rest-client'
require 'json'
class MainController < ApplicationController
    def inicio
        urlRedes = "http://localhost:8080/net/get/all/data"
        begin
            responseRedes = RestClient.get(
                urlRedes
            ) 
            @redes  = JSON.parse(responseRedes.body)
            puts @redes
            puts responseRedes.code
        rescue RestClient::ExceptionWithResponse => e
            puts "Error: #{e.response}"
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