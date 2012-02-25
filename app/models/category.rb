class Category < ActiveRecord::Base
    has_many :posts
    has_many :sub_categories, :class_name => "Category"
    belongs_to :parent, :class_name => "Category", :foreign_key => "category_id"
    
end
