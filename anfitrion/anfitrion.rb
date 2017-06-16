#!/usr/bin/env ruby

class MegaAnfitrion
    attr_accessor :nombres
    
    #crear el objeto
    def initialize(nombres = "Mundo")
        @nombres = nombres
    end
    
    #decir hola a todos
    def decir_hola
        if @nombres.nil?
            puts "..."
        elsif @nombres.respond_to?("each")
            # @nombres es una lista de algún tipo, así que podemos iterarla
            @nombres.each do |nombre|
                puts "Hola #{nombre}"
            end
        else
            puts "Hola #{@nombres}"
        end
    end
    
    def decir_adios
        if @nombres.nil?
            puts "..."
        elsif @nombres.respond_to?("join")
            puts "Adios #{@nombres.join(", ")}. Vuelvan pronto."
        else
            puts "Adios #{@nombres}. Vuelve pronto."
        end
    end
end

if __FILE__ == $0
    ma = MegaAnfitrion.new()
    ma.decir_hola
    ma.decir_adios
    
    #Cambiar el nombre a Gato
    ma.nombres = "Gato"
    ma.decir_hola
    ma.decir_adios
    
    #Cambiar el nombre a un vector de nombres
    ma.nombres = ["Luis", "Alberto", "Josefina"]
    ma.decir_hola
    ma.decir_adios
    
    #Cambiarlo a nil
    ma.nombres = nil
    ma.decir_hola
    ma.decir_adios
end