require 'test_helper'

class RestauranteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :restaurantes

  def test_restaurante
  	restaurante = Restaurante.new(
  		:nome => restaurantes(:fasano).nome,
  		:endereco => restaurantes(:fasano).endereco,
  		:especialidade => restaurantes(:fasano).especialidade)
  	msg = "restaurante não foi salvo. "
  		+ "errors: ${restaurante.errors.inspect}"
  	assert restaurante.save, msg

  	restaurante_fasano_copia = Restaurante.find(restaurante.id)
  	assert_equal restaurante.nome, restaurante_fasano_copia.nome
  end

end
