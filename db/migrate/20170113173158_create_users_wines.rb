class CreateUsersWines < ActiveRecord::Migration
  def change
    create_table :users_wines do |t|
      t.references :user, index: true, foreign_key: true
      t.references :wine, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
