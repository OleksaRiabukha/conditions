class CreateConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :conditions do |t|
      t.string :name
      t.string :model_name
      t.jsonb :formula


      t.timestamps
    end
  end
end
