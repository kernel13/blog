class Post < ActiveRecord::Base
    belongs_to :category
    
    validates_presence_of :name
    validates_presence_of :title
    
    #Set 10 item per page
    self.per_page = 10
end
