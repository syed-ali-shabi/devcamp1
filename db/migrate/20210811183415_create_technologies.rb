class CreateTechnologies < ActiveRecord::Migration[6.1]
  def change
    create_table :technologies do |t|
      t.string :name
      t.references :portfolio, null: false, foreign_key: false

      t.timestamps
    end
  end
end
