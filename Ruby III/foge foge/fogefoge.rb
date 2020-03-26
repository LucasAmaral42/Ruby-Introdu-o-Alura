require_relative 'ui'

def le_mapa(numero)
    arquivo = "mapa#{numero}.txt"
    texto = File.read(arquivo)
    mapa = texto.split("\n")
end

def encontra_jogador(mapa)
    heroi = "H"
    mapa.each_with_index do |linha_atual, linha|
        coluna_do_heroi = linha_atual.index(heroi)
        if coluna_do_heroi
            return [linha,coluna_do_heroi]
        end
    end
    
end

def movimenta(direcao, heroi)
    heroi = heroi.dup
    case direcao
        when "W"
            heroi[0] -= 1
        when "S"
            heroi[0] += 1
        when "A"
            heroi[1] -= 1
        when "D"
            heroi[1] += 1
    end
    heroi
end

def detecta_colisao? (mapa, nova_posicao)
    if nova_posicao[0] < 0 || nova_posicao[0] >= mapa.size
        return false
    end
    if nova_posicao[1] < 0 || nova_posicao[1] >= mapa[0].size
        return false
    end
    if mapa[nova_posicao[0]][nova_posicao[1]] == "X"
        return false        
    end
    true
end

def joga (nome)
    mapa = le_mapa(1)

    while true
        desenha(mapa)
        direcao = pede_movimento
        heroi = encontra_jogador(mapa)
        nova_posicao = movimenta(direcao, heroi)

        if !detecta_colisao?(mapa, nova_posicao)
            next
        end

        mapa[heroi[0]][heroi[1]] = " "
        mapa[nova_posicao[0]][nova_posicao[1]] = "H"
    end
end

def inicia_fogefoge
    nome = da_boas_vindas
    joga(nome)
end