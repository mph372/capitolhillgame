class State < ApplicationRecord
  belongs_to :congress
  has_many :districts

  def generate_name
      @states_list = ["Calisota",
                      "Coventry",
                      "Ames",
                      "Midlands",
                      "Reserve",
                      "Catawba",
                      "Deseret",
                      "Dorado",
                      "Fremont",
                      "Hohoq",
                      "Mickewa",
                      "New Leicester",
                      "Ochichornia",
                      "Oconee",
                      "Sequoyah",
                      "Udana",
                      "Washagon",
                      "Winnemac",
                      "Delmarva",
                      "New Troy",
                      "Statesota",
                      "Alderney",
                      "Columbia",
                      "Liberty",
                      "Temperance",
                      "North Yankton",
                      "Ambarino",
                      "Lemoyne",
                      "Saligua",
                      "Iamepiasal",
                      "United Vaalviamaii",
                      "Central Naofriblicand",
                      "Maarvis",
                      "Zimslands Manaldo",
                      "Peczech Thuaque",
                      "Landmyan",
                      "Iand",
                      "North Bise",
                      "Cuandxi",
                      "Vatory Republic",
                      "Thiorun",
                      "Bata",
                      "Republic of Rali",
                      "Codorkmeco",
                      "Norporca",
                      "Ghakiwan",
                      "Southern Ifrenchry",
                      "Diaza Naland",
                      "Nesrisouthua",
                      "Mamo Satriroc"]
      @shared_states = congress.states
      loop do
        @state_name = @states_list.sample
        break if @shared_states.any?{|s| s.name == @state_name} == false
      end    
      update_attribute(:name, @state_name)
    end

  def generate_region
    number_of_border_states = (congress.number_of_states * 0.16).round
    @border_states = []
    congress.states.order("latino_population desc").limit(number_of_border_states).each do |state|
      @border_states << state
    end
    print @border_states
      if @border_states.include?(self)
        state_region = "Border Region"
      elsif number_of_districts == 1 && pvi > 0
        random = rand(1..2)
        if random == 1
        state_region = "Big Sky"
        elsif random == 2
        state_region = "Plains"
        end
      elsif number_of_districts == 1  && pvi <= 0
        state_region = "Northeast"
      elsif pvi >= 12
        state_region = "South"
      elsif pvi <= -8
        state_region = ["Pacific Coast", "Northeast"].sample
      elsif pvi.between?(7,11)
        state_region = "Coastal Southeast"
      else
        state_region = ["Appalachia", "Midwest", "Rust Belt"].sample
      end
      update_attribute(:region, state_region)  
  end

  def true_pvi
    if pvi.present?
      if pvi > 0
        "R+#{pvi}"
      elsif pvi < 0
        "D+#{pvi*-1}"
      elsif pvi == 0
        "EVEN"
      end
    end
  end


 end

  
