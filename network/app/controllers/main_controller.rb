require 'rest-client'
require 'json'
class MainController < ApplicationController
    def inicio
        p session[:busqueda]
        p session[:busqueda].present?
        p "------------------------------------------------------------------------------------------------------------------"
        unless session[:busqueda].present?
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
        else 
            @redes = session[:busqueda]
        end
    end

    def busqueda
        urlBuscar = "http://localhost:8080/net/red/by/search"
        puts params
        p "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"

        ip = params[:selected_IP]
        begin
            responseBuscar = RestClient.post(
                urlBuscar,
                {ip: ip}
            ) 
            session[:busqueda]  = JSON.parse(responseBuscar.body)
            puts params[:selected_IP]
            puts session[:busqueda]
            puts responseBuscar.code
        rescue RestClient::ExceptionWithResponse => e
            puts "Error: #{e.response}"
        end
        redirect_to "/inicio"
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