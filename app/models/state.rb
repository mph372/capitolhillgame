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
      @regions = ["Pacific Northwest", "Southwest", "South", "Border Region", "Big Sky", "Plains States", "Midwest", "Northeast"]
      @state_region = @regions.sample
      update_attribute(:region, @state_region)
    end



  end
