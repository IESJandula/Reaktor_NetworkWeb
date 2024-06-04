require 'rest-client'
require 'json'
require 'csv'

class MainController < ApplicationController

    def inicio
        urlBuscar = "http://localhost:8080/net/red/by/search"
        puts params
        
        ip = params[:selected_IP].present? ? params[:selected_IP] : "" # Si está presente, toma el valor, de lo contrario, toma una cadena vacía
        mac = params[:selected_mac].present? ? params[:selected_mac] : ""
        tipo = params[:selected_tipo].present? ? params[:selected_tipo] : ""

        begin
            responseBuscar = RestClient.get(
            urlBuscar,
            params: { ip: ip, mac: mac, tipo: tipo } # Pasar el parámetro como parte de los parámetros de la solicitud
            ) 
            @redes = []
            @redes = JSON.parse(responseBuscar.body)
            puts params[:selected_IP]
            puts params[:selected_mac]
            puts params[:selected_tipo]
            puts @redes
            puts responseBuscar.code
        rescue RestClient::ExceptionWithResponse => e
            puts "Error: #{e.response}"
            @redes = []
        end
    end

    def export_csv
        inicio
        redes = @redes
    
        csv_data = CSV.generate(headers: true) do |csv|
          csv << ['Nombre de Red', 'Nombre', 'IP', 'MAC', 'Tipo', 'Fecha', 'SO', 'Puertos', 'ID Equipo']
    
          redes.each do |red|
            red['equipos'].each do |equipo|
              puertos = equipo['puertos'].map { |puerto| "Número: #{puerto['puertoId']['numero']}, Nombre: #{puerto['nombre']}" }.join(' | ')
              csv << [
                red['wlanConectionName'] || 'LAN',
                red['nombre'],
                equipo['ip'],
                equipo['mac'],
                equipo['tipo'],
                red['fecha'],
                equipo['so'],
                puertos,
                equipo['id']
              ]
            end
          end
        end
    
        respond_to do |format|
          format.csv { send_data csv_data, filename: "escaneo-redes-#{Date.today}.csv" }
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