class GuestMailer < ApplicationMailer
    default from: 'mikemiwha@gmail.com'

    def welcome_email
      @guest = params[:guest]

      mail(to: @guest.email, subject: 'Thank you for your RSVP')
    end
end
