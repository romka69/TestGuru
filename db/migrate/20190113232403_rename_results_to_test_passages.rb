class RenameResultsToTestPassages < ActiveRecord::Migration[5.2]
  def up
    rename_table :results, :test_passages
  end

  def down
    rename_table :test_passages, :results
  end
end
