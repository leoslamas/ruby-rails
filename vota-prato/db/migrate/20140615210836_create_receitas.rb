class CreateReceitas < ActiveRecord::Migration
  def change
    create_table :receitas do |t|
    	t.integer :prato_id
    	t.text :conteudo
      t.timestamps
    end
  end
end
