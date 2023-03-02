class ApplicationService
 def self.call(**args, &block)
   new(**args, &block).call
 end

 private 

 def success(value=nil)
   ServiceResult.new(:success, value)
 end

 def failure(value=nil)
   ServiceResult.new(:failure, value)
 end
end
