def boas_vindas
    puts "Bem vindo ao jogo da adivinhação";
    puts "Qual é o seu nome?";
    nome = gets;
    puts "\n\nComeçaremos o jogo para você, #{nome}";
end

def pede_dificuldade
    puts "Qual dificuldade gostaria?"
    dificuldade = gets.to_i
    case dificuldade
    when 1
        maximo = 30
    when 2
        maximo = 60
    when 3
        maximo = 100
    when 4
        maximo = 150
    else
        maximo = 200
    end
end

def sorteia_numero_secreto(maximo)
    puts "Escolhendo um número secreto entre 1 e #{maximo}...";
    numero_secreto = rand(maximo + 1);
end

def pede_um_numero(i, limite_de_tentativas)
    puts "Tentativa #{i} de #{limite_de_tentativas}";
    puts "Entre com o número";
    chute = gets.to_i;
end

def verifica_se_acertou(chute, numero_secreto)
    if chute == numero_secreto
        puts "Adivinhou!!!";
        return true;
    end    
    if chute < numero_secreto
        puts "O número é maior!\n\n";
    else
        puts "O número é menor!\n\n";
    end
    return false;
end

boas_vindas
maximo = pede_dificuldade
numero_secreto = sorteia_numero_secreto(maximo);
limite_de_tentativas = 5;
chutes = [];

for i in 1..limite_de_tentativas
    puts "Seus números foram: " + chutes.to_s
    chute = pede_um_numero(i, limite_de_tentativas)
    chutes[i - 1] = chute;

    if verifica_se_acertou(chute, numero_secreto)
        break;
    end
end