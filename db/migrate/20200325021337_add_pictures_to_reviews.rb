class AddPicturesToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :picture, :string, default: nil
  end
end
