class GuestMailer < ApplicationMailer
    default from: ENV['gmail_username']

    def welcome_email
      @guest = params[:guest]

      mail(to: @guest.email, subject: 'Thank you for your RSVP')
    end
end
