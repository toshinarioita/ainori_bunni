class CreateRecruitments < ActiveRecord::Migration[6.1]
  def change
    create_table :recruitments do |t|
      t.datetime :datetime
      t.integer :participants
      t.integer :user_id
      t.timestamps
    end
  end
end
