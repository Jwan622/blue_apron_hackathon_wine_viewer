class AddRegionToWines < ActiveRecord::Migration
  def change
    add_column :wines, :region, :string
  end
end
