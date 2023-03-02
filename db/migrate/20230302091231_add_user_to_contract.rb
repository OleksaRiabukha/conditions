class AddUserToContract < ActiveRecord::Migration[7.0]
  def change
    add_reference :contracts, :user, index: true
  end
end
