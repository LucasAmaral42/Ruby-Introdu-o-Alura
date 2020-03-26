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
    nil
end

def movimenta_heroi(direcao, heroi)
    heroi = heroi.dup
    movimentos = {
        "W" => [-1, 0],
        "S" => [+1, 0],
        "A" => [0, -1],
        "D" => [0, +1]
    }
    movimento = movimentos[direcao]
    heroi[0] += movimento[0]
    heroi[1] += movimento[1]
    heroi
end

def soma_vetor(v1, v2)
    [v1[0] + v2[0], v1[1] + v2[1]]
end

def posicoes_validas_a_partir_de (mapa, novo_mapa, posicao)
    posicoes = []
    movimentos = [[+1, 0], [-1, 0], [0, -1], [0, +1]]
    movimentos.each do |movimento|
        nova_posicao = soma_vetor(movimento, posicao)
        if detecta_colisao?(mapa, nova_posicao) && detecta_colisao?(novo_mapa, nova_posicao)
            posicoes << nova_posicao
        end
    end
    posicoes
end

def movimenta_fantasma(mapa, novo_mapa, linha, coluna)
    posicoes = posicoes_validas_a_partir_de(mapa, novo_mapa, [linha, coluna])
    if posicoes.empty?
        return
    end

    aleaotorio = rand(posicoes.size)
    nova_posicao = posicoes[aleaotorio]

    mapa[linha][coluna] = " "
    novo_mapa[nova_posicao[0]][nova_posicao[1]] = "F"
end

def copia_mapa(mapa)
    novo_mapa = mapa.join("\n").tr("F", " ").split("\n")
end

def move_fantasmas(mapa)
    caractere_do_fantasma = "F"
    novo_mapa = copia_mapa(mapa)

    mapa.each_with_index do |linha_atual, linha|
        linha_atual.chars.each_with_index do |caractere_atual, coluna|
            fantasma = caractere_atual == caractere_do_fantasma
            if fantasma
                movimenta_fantasma(mapa, novo_mapa, linha, coluna)
            end
        end
    end
    novo_mapa
end

def detecta_colisao? (mapa, nova_posicao)
    if nova_posicao[0] < 0 || nova_posicao[0] >= mapa.size
        return false
    end
    if nova_posicao[1] < 0 || nova_posicao[1] >= mapa[0].size
        return false
    end
    if mapa[nova_posicao[0]][nova_posicao[1]] == "X" || mapa[nova_posicao[0]][nova_posicao[1]] == "F" 
        return false        
    end
    true
end

def joga (nome)
    mapa = le_mapa(2)

    while true
        desenha(mapa)
        direcao = pede_movimento
        heroi = encontra_jogador(mapa)
        nova_posicao = movimenta_heroi(direcao, heroi)

        if !detecta_colisao?(mapa, nova_posicao)
            next
        end

        mapa[heroi[0]][heroi[1]] = " "
        mapa[nova_posicao[0]][nova_posicao[1]] = "H"

        mapa = move_fantasmas(mapa)

        if encontra_jogador(mapa) == nil
            game_over
        end
    end
end

def inicia_fogefoge
    nome = da_boas_vindas
    joga(nome)
end