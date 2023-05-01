class Vista1_Laberinto

    def initialize(controlador)
    @controlador=controlador
    end
    def menu_usuario()

        estado=@controlador.estado
        values=[*1..10].map!(&:to_s)

        case estado
        when Estado_juego::EN_ENTRADA_LABERINTO
            while (!values.include? st)
                puts "Intoduzca el número de vidas (entre 1 y 10) antes de entrar en el laberinto"
                st=gets.chomp
            end
            @controlador.entrar(st.to_i)


        when Estado_juego::DENTRO_VIVO
            puts informe_dentro(@controlador.habitacion(),@controlador.vidas())
            puts "Pulse una tecla"
            st= gets.chomp
            movimiento=@controlador.intentar_avanzar()
            puts movimiento


        when Estado_juego::EN_SALIDA_LABERINT0
            puts informe_final(@controlador.vidas())
            exit 0

        when Estado_juego::DENTRO_MUERTO
            puts informe_final(@controlador.vidas())
            exit 0
        end

    end

    def informe_dentro(habitacion, vidas)
        puts "El usuario se encuentra en el lugar"+habitacion+"y le quedan"+vidas
    end
    def informe_final(vidas)
        habitacion=@controlador.habitacion_usuario()
        case estado
        when Estado_juego::EN_SALIDA_LABERINTO
        puts "Al usuario le han quedado"+vidas+"vidas y esta se ha quedado en la habitación"+habitacion
    end

end
