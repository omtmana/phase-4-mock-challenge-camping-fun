class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :activities, :diffculty, :difficulty
  end
end
