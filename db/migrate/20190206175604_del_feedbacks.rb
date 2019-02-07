class DelFeedbacks < ActiveRecord::Migration[5.2]
  def self.up
    drop_table :feedbacks
  end

  def self.down
    create_table :feedbacks do |t|
      t.string :body
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
