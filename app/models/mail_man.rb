class MailMan < ActionMailer::Base
  
  # def generic_mailer(options)
  #   @recipients = options[:recipients] || "me@privacy.net"
  #   @from       = options[:from]       || "me@privacy.net"
  #   @cc         = options[:cc]         || ""
  #   @bcc        = options[:bcc]        || ""
  #   @subject    = options[:subject]    || ""
  #   @body       = options[:body]       || {}
  #   @headers    = options[:headers]    || {}
  #   @charset    = options[:charset]    || "utf-8"
  #   @attachment = options[:attachment] || {}
  # end
  # 
  # def MailMan.mails *syms
  #   syms.each do |sym|
  #     s = %Q{
  #       def #{sym}(options) 
  #         self.generic_mailer(options)
  #       end
  #     }
  #     class_eval s
  #   end
  # end
  # mails :comment
  
  def comment(email_params, sent_at = Time.now)
      @subject = "[Remcraft Website Contact] #{email_params[:subject]}"
      @recipients  = "customerservice@remcraft.com"
      @from  = email_params[:address]
      @sent_on = sent_at

      # allows access to @message and @sender_name
      # in the view
      @body = { :message => email_params[:body], :sender_name => email_params[:name] }
    end
    
end
