class AddVineyardToWines < ActiveRecord::Migration
  def change
    add_column :wines, :vineyard, :string
  end
end
