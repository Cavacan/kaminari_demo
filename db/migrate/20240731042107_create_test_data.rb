class CreateTestData < ActiveRecord::Migration[7.1]
  def change
    create_table :test_data do |t|
      t.string :name
      t.string :food

      t.timestamps
    end
  end
end
