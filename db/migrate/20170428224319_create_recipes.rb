class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.integer :calories
      t.integer :people_fed
      t.integer :cook_time
      t.string :course
      t.timestamps
    end
  end
end
