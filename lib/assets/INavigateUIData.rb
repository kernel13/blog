module INavigateUIData
    
    #Description
    # => Contains a description of the node
    def description
      @descripton
    end
  
    def description=(value)
      @description = value
    end
    
    #Name
    # => Contains the name of the node
    def name
      @name
    end
    
    def name=(value)
      @name = name
    end 
    
    #Navigate url
    # => Contains the url of the node
    def navigationUrl
      @url
    end
    
    def navigationUr=(value)
      @url = value
    end
    
    #Value
    # => Contains addional information on the node
    def value
      @value
    end
    
    def value=(value)
      @value = value
    end
  
end