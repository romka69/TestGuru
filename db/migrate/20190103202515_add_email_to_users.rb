class AddEmailToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column(:users, :email, :string, index: { unique: true })
    change_column_null(:users, :email, false)
  end
end
