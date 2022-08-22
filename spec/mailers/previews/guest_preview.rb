# Preview all emails at http://localhost:3000/rails/mailers/guest
class GuestPreview < ActionMailer::Preview
    def welcome_email
        lodgings = FactoryBot.create(:lodging)
        team = FactoryBot.create(:team)
        guest = FactoryBot.create(:guest, lodging_id: lodgings.id, team_id: team.id) 

        GuestMailer.with(guest: guest).welcome_email
    end
end
