class DailyMailController < ApplicationController
    
    def index
        require 'gmail'
        @pending = Task.where(completed: nil)
        complete = Task.where.not(completed: nil).pluck(:id)
        @completed = Task.where(id: complete , completed: Date.today)
        
        user_name = 'kyony.j@gmail.com'
        password  = 'f@cus1sbr1ght21'
        gmail = Gmail.new(user_name,password) 
        gmail.deliver do 
            to "kanyinda.a@infoset.cd"
            subject "Daily report"
            text_part do 
                body "This are the following task that are completed"
                    @completed.each do |task_completed|
                        task_completed.title
                    end
                    "This is the following task that are pending"
                        @pending.each do |task_pending|
                            task_pending.title
                        end
            end
        end
        
        redirect_to root_path
                        
                
            
    end
end
