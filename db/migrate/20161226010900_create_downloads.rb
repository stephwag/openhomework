class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.integer :assignment_id
      t.string :stripe_email
      t.string :stripe_token
      t.timestamps null: false
    end

    add_index "downloads", ["assignment_id"], name: "index_downloads_on_assignment_id", using: :btree
  end
end
