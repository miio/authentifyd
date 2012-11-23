# This migration comes from authentifyd (originally 20121120091700)
class CreateAuthentifydAuthentications < ActiveRecord::Migration
  def change
    create_table :authentifyd_authentications do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end