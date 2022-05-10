class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.references :customer, foreign_key: true
      t.jsonb :data
      t.datetime :date_sale

      t.timestamps
    end
  end
end
