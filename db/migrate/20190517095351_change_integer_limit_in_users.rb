class ChangeIntegerLimitInUsers < ActiveRecord::Migration[5.0]
    def change
      change_column :users, :id, :integer, limit: 8
    end
  end
  