class DashboardFacade
  def initialize
    @guests = Guest.all.order(updated_at: :desc )
    @attending = Guest.rsvp_yes.order(updated_at: :desc )
    @not_attending = Guest.rsvp_no.order(updated_at: :desc )
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

  def comments
    comment_list = Guest.where.not(comments: nil).order(updated_at: :desc ).map do |guest|
      c = {}
      c[:guest_id] = guest.id
      c[:name] = guest.full_name
      c[:comment] = guest.comments
      c
    end
  end

  def diets
    diet_list = Guest.where.not(diet: nil).order(updated_at: :desc ).map do |guest|
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
  }
    diet_list = Guest.where.not(diet: nil).order(updated_at: :desc ).map do |guest|
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
    rsvp_statistics[:yes] = @attending.count
    rsvp_statistics[:no] = @not_attending.count
    rsvp_statistics[:pending] = @guests.count - (rsvp_statistics[:yes] + rsvp_statistics[:no])
    rsvp_statistics[:kids] = 0
    rsvp_statistics[:plus_ones] = 0
    @attending.each do |guest|
      rsvp_statistics[:kids] = rsvp_statistics[:kids] + guest.kids.count
      rsvp_statistics[:plus_ones] = rsvp_statistics[:plus_ones] + guest.plus_ones.count
    end
    rsvp_statistics[:total] = rsvp_statistics[:yes] + rsvp_statistics[:kids] + rsvp_statistics[:plus_ones]
    rsvp_statistics
  end

  def breakfast_statistics 
    breakfast_statistics = {}
    breakfast_statistics[:yes] = Guest.breakfast_yes.count
    breakfast_statistics[:no] = Guest.breakfast_no.count
    breakfast_statistics[:pending] = Guest.all.count - (breakfast_statistics[:yes] + breakfast_statistics[:no])
    breakfast_statistics
  end

  def lodging_statistics
    lodging_statistics = {}
    offsite_id = Lodging.offsite.first.id
    ids_to_exclude = [nil, offsite_id]
    lodging_statistics[:onsite] = Guest.where.not(lodging_id: ids_to_exclude).count 
    lodging_statistics[:offsite] = Guest.where(lodging_id: offsite_id).count 
    lodging_statistics[:pending] = Guest.where(lodging_id: nil).count 
    lodging_statistics
  end

  def arrival_date_statistics
    arrival_date_statistics = {}
    arrival_date_statistics[:friday] = Guest.friday.count 
    arrival_date_statistics[:saturday] = Guest.saturday.count 
    arrival_date_statistics[:pending] = Guest.where(arrival_date: nil).count 
    arrival_date_statistics
  end

  def dodge_ball_statistics 
    dodge_ball_statistics = {}
    dodge_ball_statistics[:yes] = Guest.where.not(team_id: nil).count 
    dodge_ball_statistics[:no_and_pending] = Guest.where(team_id: nil).count 
    dodge_ball_statistics
  end
end