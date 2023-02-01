class GuestMailer < ApplicationMailer
    default from: ENV['gmail_username']

    def welcome_email
      @guest = params[:guest]
      attachments.inline["Group_4.svg"] = File.read("#{Rails.root}/app/assets/images/Group_4.svg")
      attachments.inline["Group_2.svg"] = File.read("#{Rails.root}/app/assets/images/Group_2.svg")
      attachments.inline["instagram2x.png"] = File.read("#{Rails.root}/app/assets/images/instagram2x.png")
      attachments.inline["mail2x.png"] = File.read("#{Rails.root}/app/assets/images/mail2x.png")
      attachments.inline["website2x.png"] = File.read("#{Rails.root}/app/assets/images/website2x.png")
      
      mail(to: @guest.email, subject: 'Thank you for your RSVP')
    end
end
