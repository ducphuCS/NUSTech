class AddPasswordToUser < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.string :password, limit: 64
    end
  end
end