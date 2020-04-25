class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :user
      t.string :text
      t.datetime :finished_at

      t.timestamps
    end
  end
end
