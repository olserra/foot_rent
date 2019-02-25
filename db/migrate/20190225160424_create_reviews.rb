class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :stars
      t.references :player, foreign_key: true
      t.references :club, foreign_key: true

      t.timestamps
    end
  end
end
