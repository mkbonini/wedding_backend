class GuestMailer < ApplicationMailer
    default from: ENV['gmail_username']

    def welcome_email
      @guest = params[:guest]
      
      attachments.inline["instagram2x.png"] = File.read("#{Rails.root}/app/assets/images/instagram2x.png")
      attachments.inline["mail2x.png"] = File.read("#{Rails.root}/app/assets/images/mail2x.png")
      attachments.inline["website2x.png"] = File.read("#{Rails.root}/app/assets/images/website2x.png")

      mail(to: @guest.email, subject: "Thank you for your RSVP to Michael & Miwha's wedding")
    end

    def no_email
      @guest = params[:guest]
      
      attachments.inline["instagram2x.png"] = File.read("#{Rails.root}/app/assets/images/instagram2x.png")
      attachments.inline["mail2x.png"] = File.read("#{Rails.root}/app/assets/images/mail2x.png")
      attachments.inline["website2x.png"] = File.read("#{Rails.root}/app/assets/images/website2x.png")

      mail(to: @guest.email, subject: "ya dead to us ...")
    end

    def notification_email
      @guest = params[:guest]

      attachments.inline["plane.png"] = File.read("#{Rails.root}/app/assets/images/plane.png")

      mail(to: ENV['gmail_username'], subject: "#{@guest.full_name} has RSVPed #{@guest.rsvp}")
    end

    def reminder_email
      @guest = params[:guest]

      mail(to: @guest.email, subject: "Important Info Regarding M+M's Wedding! (July 21-23, 2023)")
    end

    def photo_email
      @guest = params[:guest]

      mail(to: @guest.email, subject: "Loved seeing you, let's share photos!!")
    end
end
