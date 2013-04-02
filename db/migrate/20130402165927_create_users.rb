class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :team_id
      t.string :username
      t.string :email
      t.timestamps
    end
  end
end
