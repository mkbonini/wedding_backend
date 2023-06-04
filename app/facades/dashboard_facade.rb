
class DashboardFacade
  def initialize
    @guests = Guest.all.order(updated_at: :desc )
    # @attending = @guests.rsvp_yes.order(updated_at: :desc )
    @attending = attending()
    @not_attending = @guests.rsvp_no.order(updated_at: :desc )
    @comments = comments()
    @diets = diets()
    @diet_keywords = diet_keywords()
    @lodgings = lodging_list()
    @rsvp_statistics = rsvp_statistics()
    @breakfast_statistics = breakfast_statistics()
    @lodging_statistics = lodging_statistics()
    @arrival_date_statistics = arrival_date_statistics()
    @dodge_ball_statistics = dodge_ball_statistics()
  end

  def party(guest)
    party = guest.full_name

    guest.plus_ones.each do |po|
      party = party + ", " +  po.name
    end

    guest.kids.each do |kid|
      party = party + ", " + kid.name
    end

    return party
  end

  def attending 
    attending_list = @guests.rsvp_yes.order(updated_at: :desc ).map do |guest|
      a = guest.as_json
      a[:party] = party(guest)
      a
    end
  end
  
  def comments
    comment_list = @guests.where.not(comments: nil).order(updated_at: :desc ).map do |guest|
      c = {}
      c[:guest_id] = guest.id
      c[:name] = guest.full_name
      c[:comment] = guest.comments
      c
    end
  end

  def diets
    diet_list = @guests.where.not(diet: nil).order(updated_at: :desc ).map do |guest|
      d = {}
      d[:guest_id] = guest.id
      d[:name] = guest.full_name
      d[:diet] = guest.diet
      d
    end
  end

  def diet_keywords
    keywords = {	
      "shellfish" => 0,
      "milk" => 0,
      "egg" => 0,
      "soy" => 0,
      "wheat" => 0,
      "tree nut"  => 0,
      "nut"  => 0,
      "pine nut"  => 0,
      "peanut" => 0,
      "gluten" => 0,
      "lactose" => 0,
      "keto" => 0,
      "kosher" => 0,
      "vegetarian" => 0,
      "vegan" => 0,
      "mango" => 0,
      "pistachio" => 0,
      "pescatarian" => 0,
      "fish" => 0,
      "sesame" => 0,
      "coconut" => 0,
      "dairy" => 0,
      "avocado" => 0,
      "kiwi" => 0,
  }
    diet_list = @guests.where.not(diet: nil).order(updated_at: :desc ).map do |guest|
      keywords.each do |key, value|
       if guest.diet.downcase.include?(key)
        keywords[key] += 1
       end
      end
    end
    keywords.select {|k,v| v != 0}
  end

  def lodging_list
    lodgings = Lodging.all.map do |lodge|
      l = {}
      l[:name] = lodge.name
      l[:title] = lodge.title
      l[:occupants] = lodge.occupants
      l
    end
  end

  def rsvp_statistics 
    rsvp_statistics = {}
    rsvp_statistics[:yes] = @guests.rsvp_yes.sum(:party_count)
    rsvp_statistics[:no] = @not_attending.sum(:party_count)
    rsvp_statistics[:pending] = @guests.sum(:party_count) - (rsvp_statistics[:yes] + rsvp_statistics[:no])
    rsvp_statistics[:total] = rsvp_statistics[:yes]
    rsvp_statistics
  end

  def breakfast_statistics 
    breakfast_statistics = {}
    breakfast_statistics[:yes] = @guests.breakfast_yes.sum(:party_count)
    breakfast_statistics[:no] = @guests.breakfast_no.sum(:party_count)
    breakfast_statistics[:pending] = @guests.all.sum(:party_count) - (breakfast_statistics[:yes] + breakfast_statistics[:no])
    breakfast_statistics
  end

  def lodging_statistics
    lodging_statistics = {}
    offsite_id = Lodging.offsite.first.id
    ids_to_exclude = [nil, offsite_id]
    lodging_statistics[:onsite] = @guests.where.not(lodging_id: ids_to_exclude).sum(:party_count)
    lodging_statistics[:offsite] = @guests.where(lodging_id: offsite_id).sum(:party_count)
    lodging_statistics[:pending] = @guests.where(lodging_id: nil).sum(:party_count) 
    lodging_statistics
  end

  def arrival_date_statistics
    arrival_date_statistics = {}
    arrival_date_statistics[:friday] = @guests.friday.sum(:party_count)
    arrival_date_statistics[:saturday] = @guests.saturday.sum(:party_count)
    arrival_date_statistics[:pending] = @guests.where(arrival_date: nil).sum(:party_count)
    arrival_date_statistics
  end

  def dodge_ball_statistics 
    dodge_ball_statistics = {}
    dodge_ball_statistics[:yes] = @guests.where.not(team_id: nil).count 
    dodge_ball_statistics[:yes] += Kid.where.not(team_id: nil).count
    dodge_ball_statistics[:yes] += PlusOne.where.not(team_id: nil).count
    dodge_ball_statistics[:no_and_pending] = @guests.where(team_id: nil).count 
    dodge_ball_statistics
  end
end