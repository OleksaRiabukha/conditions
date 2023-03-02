class AddContractToSupplier < ActiveRecord::Migration[7.0]
  def change
    add_reference :suppliers, :contract, index: true 
  end
end
