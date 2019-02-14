class RenameColumnInBadges < ActiveRecord::Migration[5.2]
  def self.up
    change_table :badges do |t|
      t.rename :rule, :param
      t.rename :title, :rule
    end
  end

  def self.down
    change_table :badges do |t|
      t.rename :rule, :title
      t.rename :param, :rule
    end
  end
end
