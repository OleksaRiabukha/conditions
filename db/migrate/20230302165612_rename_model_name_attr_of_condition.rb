class RenameModelNameAttrOfCondition < ActiveRecord::Migration[7.0]
  def change
    rename_column :conditions, :model_name, :base_model_name
  end
end
