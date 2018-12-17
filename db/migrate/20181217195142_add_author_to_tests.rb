class AddAuthorToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference(:tests, :author, foreign_keys: true)
  end
end
