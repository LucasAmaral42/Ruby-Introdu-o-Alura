require_relative 'livros'
require_relative 'estoque'

agile = Livro.new('Agile Web Development with Rails', 100.00, 1999, true)
teste = Livro.new('Teste 5% de desconto', 100.00, 1999, false)

estoque = Estoque.new()

estoque.<<(agile)
estoque.<<(teste)
estoque.exporta_csv

estoque.remove(teste)
estoque.exporta_csv
