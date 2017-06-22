class AddFromToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :from, :string
  end
end
