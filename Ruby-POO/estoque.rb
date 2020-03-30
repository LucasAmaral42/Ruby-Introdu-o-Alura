require_relative 'contador'


class Estoque
  attr_reader :livros
  def initialize
    @livros = []
    @livros.extend Contador
  end

  def total
    @livros.size
  end

  def mais_barato_que(valor)
    @livros.select do |livro|
      livro.preco <= valor
    end
  end

  def exporta_csv
    @livros.each(&:to_csv)
  end

  def <<(livro)
    @livros << livro if livro
    self
  end

  def remove(livro)
    @livros.delete livro
  end

  def maximo_necessario
    @livros.maximo_necessario
  end
end

