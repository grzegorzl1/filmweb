class CreateActors < ActiveRecord::Migration[5.1]
  def change
    create_table :actors do |t|
      t.string :name_surname
      t.date :date_of_birth
      t.string :country_of_origin
      t.string :biography
      t.string :filmography

      t.timestamps
    end
  end
end
