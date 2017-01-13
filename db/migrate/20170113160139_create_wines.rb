class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.integer :year
      t.text :description
      t.float :alcohol_by_volume
      t.string :ttb_label
      t.string :slug
      t.text :oak
      t.text :soil
      t.integer :min_serve_temperature
      t.integer :max_serve_temperature
      t.text :fun_facts
      t.text :aromas
      t.text :taste
      t.integer :fruit
      t.integer :earth
      t.integer :body
      t.integer :acid
      t.integer :tannins
      t.integer :alcohol
      t.integer :sweetness
      t.text :classic_pairings
      t.string :label_image
      t.string :bottle_image
      t.integer :vineyard_id
      t.text :appearance
      t.integer :appearance_focus
      t.text :appellation_region_state
      t.text :farming
      t.text :lifestyle_image
      t.text :profile
      t.text :tasting_tip
      t.text :appearance_description
      t.text :tasting_card
      t.text :status
      t.text :region_description
      t.integer :public_id
      t.text :ds_lifestyle_image

      t.timestamps null: false
    end
  end
end
