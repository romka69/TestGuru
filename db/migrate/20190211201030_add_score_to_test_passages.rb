class AddScoreToTestPassages < ActiveRecord::Migration[5.2]
  def self.up
    add_column :test_passages, :score, :integer, default: :null
  end
end
