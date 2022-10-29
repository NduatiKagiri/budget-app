class AddCategoryToTransaktion < ActiveRecord::Migration[7.0]
  def change
    add_reference :transaktions, :category, null: false, foreign_key: { to_table: 'categories' }
  end
end
