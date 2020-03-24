class CreatePet < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :image
      t.string :name
      t.string :description
      t.integer :approximate_age
      t.string :sex
      t.string :adoption_status
      t.integer :shelter_id

      t.timestamp
    end
  end
end
