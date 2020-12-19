class AddColumnsToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :youtube_id, :string
  end
end
