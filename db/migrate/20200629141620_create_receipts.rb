class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.float :valor
      t.references :patient, null: false, foreign_key: true
      t.text :descricao_tratamento

      t.timestamps
    end
  end
end
