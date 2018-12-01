class CreateForexes < ActiveRecord::Migration[5.2]
  def change
    create_table :forexes do |t|
      t.string :currency
      t.numeric :rate

      t.timestamps
    end
  end
end
