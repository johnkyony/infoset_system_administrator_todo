class DailyMailController < ApplicationController
    
    def index
        require 'gmail'
        @pending = Task.where(completed: nil)
        complete = Task.where.not(completed: nil).pluck(:id)
        @completed = Task.where(id: complete).order(completed: :desc)
        
        user_name = 'kyony.j@infoset.cd'
        password  = 'f@cus1sbr1ght21'
        gmail = Gmail.new(user_name,password) 
        gmail.deliver do 
            to "jkyony@gmail.com"
            subject "Daily report"
            text_part do 
                body "This are the following task that are completed"
                   
                    
                    
            end
        end
        
        redirect_to root_path
                        
                
            
    end
end
