class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.references :user, foreign_key: true
      t.text :name
      t.datetime :created_on

      t.timestamps
    end
  end
end
