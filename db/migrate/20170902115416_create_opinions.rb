class CreateOpinions < ActiveRecord::Migration[5.1]
  def change
    create_table :opinions do |t|
      t.string :author
      t.integer :rating
      t.text :comment
      t.references :film, foreign_key: true
      
      t.timestamps
    end
  end
end
