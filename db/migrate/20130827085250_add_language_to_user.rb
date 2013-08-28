class AddLanguageToUser < ActiveRecord::Migration
  def change
    add_column :authentifyd_users, :language, :string
  end
end
