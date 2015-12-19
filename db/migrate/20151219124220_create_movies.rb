class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :year
      t.string :title
      t.integer :budget

      t.timestamps null: false
    end
  end
end
