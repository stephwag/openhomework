class AddIt < ActiveRecord::Migration
  def change
    add_column :assignments, :content_type, :string
  end
end
