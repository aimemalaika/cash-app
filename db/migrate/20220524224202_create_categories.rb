class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :Name
      t.json :icon_data

      t.timestamps
    end
  end
end
