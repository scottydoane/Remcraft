class ContactsController < ApplicationController
  layout 'public'
  
  
  def send_mail
    MailMan.deliver_comment(params[:email])
    redirect_to :controller => "info", :action => "thanks"
  end
  
end
