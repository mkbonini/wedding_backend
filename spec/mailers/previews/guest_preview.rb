# Preview all emails at http://localhost:3000/rails/mailers
class GuestMailerPreview < ActionMailer::Preview
    def welcome_email
        lodgings = FactoryBot.create(:lodging)
        team = FactoryBot.create(:team)
        guest = FactoryBot.create(:guest, lodging_id: lodgings.id, team_id: team.id) 

        GuestMailer.with(guest: guest).welcome_email
    end

    def no_email
        lodgings = FactoryBot.create(:lodging)
        team = FactoryBot.create(:team)
        guest = FactoryBot.create(:guest, lodging_id: lodgings.id, team_id: team.id) 

        GuestMailer.with(guest: guest).no_email
    end

    def notification_email
        lodgings = FactoryBot.create(:lodging)
        team = FactoryBot.create(:team)
        guest = FactoryBot.create(:guest, lodging_id: lodgings.id, team_id: team.id) 

        GuestMailer.with(guest: guest).notification_email
    end

    def reminder_email
        lodgings = FactoryBot.create(:lodging)
        team = FactoryBot.create(:team)
        guest = FactoryBot.create(:guest, lodging_id: lodgings.id, team_id: team.id) 
        kid1 = FactoryBot.create(:kid, lodging_id: lodgings.id, team_id: team.id, guest_id: guest.id) 
        kid2 = FactoryBot.create(:kid, lodging_id: lodgings.id, team_id: team.id, guest_id: guest.id) 
        plus_one = FactoryBot.create(:plus_one, lodging_id: lodgings.id, team_id: team.id, guest_id: guest.id) 


        GuestMailer.with(guest: guest).reminder_email
    end

    def photo_email
        lodgings = FactoryBot.create(:lodging)
        team = FactoryBot.create(:team)
        guest = FactoryBot.create(:guest, lodging_id: lodgings.id, team_id: team.id) 
        kid1 = FactoryBot.create(:kid, lodging_id: lodgings.id, team_id: team.id, guest_id: guest.id) 
        kid2 = FactoryBot.create(:kid, lodging_id: lodgings.id, team_id: team.id, guest_id: guest.id) 
        plus_one = FactoryBot.create(:plus_one, lodging_id: lodgings.id, team_id: team.id, guest_id: guest.id) 


        GuestMailer.with(guest: guest).photo_email
    end
end
