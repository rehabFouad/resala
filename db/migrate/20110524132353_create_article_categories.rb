class CreateArticleCategories < ActiveRecord::Migration
  def self.up
    create_table :article_categories do |t|
      t.string :name, :null=>false
    end
  end

  def self.down
    drop_table :article_categories
  end
end
