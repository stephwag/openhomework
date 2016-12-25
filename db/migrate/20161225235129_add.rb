class Add < ActiveRecord::Migration
  def change
    add_column :assignments, :includes_answers, :boolean, default: false
  end
end
