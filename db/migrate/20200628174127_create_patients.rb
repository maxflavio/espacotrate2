class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :nome
      t.string :cpf
      t.date :data_nascimento
      t.string :telefone

      t.timestamps
    end
  end
end
