class AddSurnameToPerson < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :surname, :string
  end
end
