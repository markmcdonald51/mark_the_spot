class CreateWatchlists < ActiveRecord::Migration[7.0]
  def change
    create_table :watchlists do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :watchlist_type
      t.integer :rating
      t.references :watchable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
