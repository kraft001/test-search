class CreateJoinTableSearchesArticles < ActiveRecord::Migration[6.0]
  def change
    create_join_table :searches, :articles do |t|
      t.index [:search_id, :article_id]
      # t.index [:article_id, :search_id]
    end
  end
end
