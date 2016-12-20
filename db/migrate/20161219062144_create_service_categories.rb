class CreateServiceCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :service_categories do |t|
      t.integer :service_id
      t.integer :category_id
    end
  end
end
