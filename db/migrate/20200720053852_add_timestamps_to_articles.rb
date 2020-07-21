class AddTimestampsToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :created_at, :datetime     #articles table name,created_at attribute
    add_column :articles, :updated_at, :datetime
  end
end
