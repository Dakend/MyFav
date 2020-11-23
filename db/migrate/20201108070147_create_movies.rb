class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :image, null: false
      t.string :link, null: false
      t.string :title, null: false
      t.text :content
      t.references :post, null: false, foreign_key: true
      t.timestamps
    end
  end
end
