class AddUserToCategoriesAndTransaktions < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :user, null: false, foreign_key: { to_table: 'users' }
    add_reference :transaktions, :user, null: false, foreign_key: { to_table: 'users' }
  end
end