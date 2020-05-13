class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :user_id
      t.string :title
      t.text :url
      t.string :comment

      t.timestamps
    end
  end
end