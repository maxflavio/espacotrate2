class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.date :data_comentario
      t.text :conteudo
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
