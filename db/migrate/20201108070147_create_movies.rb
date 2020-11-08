class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :image
      t.string :link
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
