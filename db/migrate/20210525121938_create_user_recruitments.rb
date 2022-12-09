class CreateUserRecruitments < ActiveRecord::Migration[6.1]
  def change
    create_table :user_recruitments do |t|
      t.references :recruitment, null:false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
