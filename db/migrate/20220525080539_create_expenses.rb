class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :Name
      t.float :Amount

      t.timestamps
    end
  end
end
