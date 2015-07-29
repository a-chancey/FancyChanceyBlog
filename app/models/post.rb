class Post < ActiveRecord::Base
    
    
    has_many :comments
    
    belongs_to :author, class_name: "AdminUser"
    
    validates_presence_of :body, :title
    
    scope :published, -> {where(published: true) }
    
    
    def content
        MarkdownService.new.render(body)
    end
    
    def author_name
        if author
            author.name
        else
            "Nobody"
        end
    end


    def recent(count)
        return Post.published.order('id DESC')
    end

    
end
