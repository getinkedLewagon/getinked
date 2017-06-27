class ChangeRatingToInteger < ActiveRecord::Migration[5.0]
  def change
   remove_column :artists, :rating
   add_column :artists, :rating, :integer
 end
end
