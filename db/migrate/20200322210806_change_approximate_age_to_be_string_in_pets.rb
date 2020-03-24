class ChangeApproximateAgeToBeStringInPets < ActiveRecord::Migration[5.1]
  def change
    change_column :pets, :approximate_age, :string
  end
end
