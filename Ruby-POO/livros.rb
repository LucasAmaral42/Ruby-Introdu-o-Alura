class Livro
  attr_reader :titulo, :preco, :ano_lancamento, :reimpressao
  @newsletter = []
  def initialize(titulo, preco, ano_lancamento, reimpressao)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @preco = calcula_preco(preco)
    @reimpressao = reimpressao
  end

  def possui_reimpressao?
    @reimpressao
  end

  def to_csv
    puts "#{@titulo}, #{@ano_lancamento}, #{@preco}"
  end

  def calcula_preco(preco)
    if @ano_lancamento < 2006
      if possui_reimpressao?
        preco * 0.9
      else
        preco * 0.95
      end
    elsif @ano_lancamento <= 2010
      preco * 0.96
    else
      preco
    end
  end
end
