#encoding: utf-8
class Restaurante < ActiveRecord::Base
	validates_presence_of :nome, message: "Deve ser preenchido"
	validates_presence_of :endereco, message: "Deve ser preenchido"
	validates_presence_of :especialidade, message: "Deve ser preenchido"

	validates_uniqueness_of :nome, message: "Nome já cadastrado"
	validates_uniqueness_of :endereco, message: "Endereço já cadastrado"

	validate :primeira_letra_maiuscula

	has_many(:qualificacoes)
	has_and_belongs_to_many(:pratos)
	has_many :comentarios, as: :comentavel

	#has_attached_file :foto, styles: {medium: "300x300>", thumb: "100x100>"}
	#validates_attachment :foto, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	private
	def primeira_letra_maiuscula
		errors.add(:nome, "Primeira letra deve ser maiúscula") unless nome =~ /[A-Z].*/
	end
end
