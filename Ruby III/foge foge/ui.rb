def da_boas_vindas
    puts 'Boas vindas ao Foge Foge'
    puts 'Qual o seu nome?'
    nome = gets
end

def desenha(mapa)
    puts mapa
end

def pede_movimento
    puts 'para onde deseja ir?'
    movimento = gets.strip
end

def game_over
    puts 'Cabo pra você'
end