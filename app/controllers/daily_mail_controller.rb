class DailyMailController < ApplicationController
    
    def index
        require 'gmail'
        pending = Task.where(completed: nil)
        # complete = Task.where.not(completed: nil).pluck(:id)
        completed = Task.find_by(completed: Date.today)
        pending_body_content = ""
        pending.each do |i|
            pending_body_content += " - #{i.title}  \n"
        end
        completed_body_content = ""
        completed.each do |c|
            completed_body_content += "- #{c.title} \n"
  
        end
        user_name = 'kyony.j@infoset.cd'
        password  = 'f@cus1sbr1ght21'
        gmail = Gmail.new(user_name,password) 
        gmail.deliver do 
            to "jkyony@gmail.com"
            subject "Daily report"
            text_part do 
                body "This are the following task that are completed \n #{completed_body_content} \n This is the pending task \n #{pending_body_content} " 
            end
        end
        
        redirect_to root_path
                        
                
            
    end
end
