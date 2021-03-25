class Congress < ApplicationRecord
    belongs_to :owner, class_name: "User"
    has_many :memberships
    has_many :members, through: :memberships, source: :user
    has_many :states, dependent: :destroy
    has_many :districts, dependent: :destroy
    has_many :politicians, dependent: :destroy
    accepts_nested_attributes_for :states
    validates_numericality_of :size, :only_integer => true, 
                                :greater_than_or_equal_to => 5,
                                :less_than_or_equal_to => 435,
                                :message => "can only be number between 5 and 435."
    validates_numericality_of :number_of_states, :only_integer => true, 
                                :greater_than_or_equal_to => 2,
                                :less_than_or_equal_to => 50,
                                :message => "can only be number between 2 and 50."
    validate :size_is_larger
    

    def size_is_larger
        errors[:base] << "There cannot be more states than districts." unless size > number_of_states
    end


    def assign_district_counts
        @number_of_states = number_of_states
        @number_of_districts = size
        @numbers = []

       
        $i = 1
        while $i < @number_of_states do
            random = rand(1..@number_of_districts)
            @numbers << random
            $i += 1
        end

        @final_numbers = []
        @numbers.push(1,(@number_of_districts+1))
        @numbers.sort!
        @numbers.each_index do |i|
            next if i == 0
            difference = (@numbers[i] - @numbers[i-1])
            @final_numbers << difference
        end
        @final_numbers.map! {|number| number == 0 ? 1 : number}
       if @final_numbers.inject(:+) > @number_of_districts
            max = @final_numbers.max
            difference = @final_numbers.inject(:+) - @number_of_districts
            max_subtractor = max - difference
            @final_numbers.map! {|number| number == max ? max_subtractor : number}

        end

        if @final_numbers.inject(:+) < @number_of_districts
            max_addition = (@final_numbers.max + 1)
            @final_numbers.map! {|number| number == max ? max_addition : number}
        end

        print @final_numbers
        print @final_numbers.inject(:+)
        
        states.each do |state|
            @array_number = rand(@final_numbers.length)
            @district_count = @final_numbers[@array_number]
            state.update_attribute(:number_of_districts, @district_count)
            @final_numbers.delete_at(@array_number)
        end

    end


    def assign_districts
        @states = states
        @districts = districts
        
        @states.each do |state|
            @districts_to_be_edited = @districts.where("state_id IS NULL").limit(state.number_of_districts)
                    @districts_to_be_edited.each do |district|
                    district.update_attribute(:state, state)
                    end       
            end
    end

    def assign_district_numbers
        @states = states
        @districts = districts

        @states.each do |state|  
            district_number = 1
            state.districts.each do |district|
                district.update_attribute(:district_number, district_number)
                district_number += 1
            end 
        end
    end 

    def calculate_state_pvi
        states.each do |state|
            @districts_pvi = []
            state.districts.each do |district|
            @districts_pvi << district.pvi
            
            end
            print @districts_pvi
            numerator = @districts_pvi.reduce(0) { |a, v| a + v }
            denominator = @districts_pvi.count
            pvi_average = numerator.to_f / denominator.to_f 
            pvi_average 
            state.update_attribute(:pvi, pvi_average)
        end
    end

    def calculate_state_population
        states.each do |state|
            @districts_population = []
            state.districts.each do |district|
                @districts_population << district.population
            
            end
            population_total = @districts_population.inject(:+)
            state.update_attribute(:population, population_total)
        end
    end

    def calculate_state_union_membership
        states.each do |state|
            @districts_unions = []
            state.districts.each do |district|
                @districts_unions << district.union_membership
            
            end
            numerator =  @districts_unions.reduce(0) { |a, v| a + v }
            denominator =  @districts_unions.count
            union_average = numerator.to_f / denominator.to_f 
            state.update_attribute(:union_members, union_average)
        end
    end


  def generate_district_regions
    districts.each do |district|
    state_region = district.state.region
    district.update_attribute(:region, state_region)
    end
  end 

    def calculate_state_gun_owners
        states.each do |state|
            @districts_guns = []
            state.districts.each do |district|
                @districts_guns << district.gun_owners
            
            end
            numerator = @districts_guns.reduce(0) { |a, v| a + v }
            denominator = @districts_guns.count
            gun_average = numerator.to_f / denominator.to_f 
            state.update_attribute(:gun_owners, gun_average)
        end
    end

    def calculate_state_density
        states.each do |state|
            @districts_density = []
            state.districts.each do |district|
            @districts_density << district.pop_per_sq_mile
            
            end
            print @districts_pvi
            numerator = @districts_density.reduce(0) { |a, v| a + v }
            denominator = @districts_density.count
            density_average = numerator.to_f / denominator.to_f 
            density_average 
            state.update_attribute(:population_density, density_average)
        end
    end

    def calculate_state_ethnicities
        calculate_state_white
        calculate_state_latino
        calculate_state_black
        calculate_state_asian
        calculate_state_other
    end

    def calculate_state_white
        states.each do |state|
            @districts_ethnicity = []
            state.districts.each do |district|
                @districts_ethnicity << district.white_population
            
            end

            numerator = @districts_ethnicity.reduce(0) { |a, v| a + v }
            denominator = @districts_ethnicity.count
            ethnicity_average = numerator.to_f / denominator.to_f 
            state.update_attribute(:white_population, ethnicity_average)
        end
    end

    def calculate_state_latino
        states.each do |state|
            @districts_ethnicity = []
            state.districts.each do |district|
                @districts_ethnicity << district.latino_population
            
            end

            numerator = @districts_ethnicity.reduce(0) { |a, v| a + v }
            denominator = @districts_ethnicity.count
            ethnicity_average = numerator.to_f / denominator.to_f 
            state.update_attribute(:latino_population, ethnicity_average)
        end
    end

    def calculate_state_black
        states.each do |state|
            @districts_ethnicity = []
            state.districts.each do |district|
                @districts_ethnicity << district.black_population
            
            end

            numerator = @districts_ethnicity.reduce(0) { |a, v| a + v }
            denominator = @districts_ethnicity.count
            ethnicity_average = numerator.to_f / denominator.to_f 
            state.update_attribute(:black_population, ethnicity_average)
        end
    end

    def calculate_state_asian
        states.each do |state|
            @districts_ethnicity = []
            state.districts.each do |district|
                @districts_ethnicity << district.asian_population
            
            end

            numerator = @districts_ethnicity.reduce(0) { |a, v| a + v }
            denominator = @districts_ethnicity.count
            ethnicity_average = numerator.to_f / denominator.to_f 
            state.update_attribute(:asian_population, ethnicity_average)
        end
    end

    def calculate_state_other
        states.each do |state|
            @districts_ethnicity = []
            state.districts.each do |district|
                @districts_ethnicity << district.other_population
            
            end

            numerator = @districts_ethnicity.reduce(0) { |a, v| a + v }
            denominator = @districts_ethnicity.count
            ethnicity_average = numerator.to_f / denominator.to_f 
            state.update_attribute(:other_population, ethnicity_average)
        end
    end

    def generate_state_region
        states.each do |state|
            number_of_border_states = (number_of_states * 0.16).round
            @border_states = []
            states.order("latino_population desc").limit(number_of_border_states).each do |border_state|
            @border_states << border_state
            end

            if @border_states.include?(state)
                state_region = "Southwest"
            elsif state.number_of_districts == 1 && state.pvi > 0
                random = rand(1..2)
                if random == 1
                state_region = "Big Sky"
                elsif random == 2
                state_region = "Plains"
                end
            elsif state.number_of_districts == 1 && state.pvi <= 0
                state_region = "Northeast"
            elsif state.pvi >= 12
                state_region = "South"
            elsif state.pvi <= -8
                state_region = ["Pacific Coast", "Northeast"].sample
            elsif state.pvi.between?(7,11)
                state_region = "Coastal Southeast"
            else
                state_region = ["Midwest", "Appalachia", "Rust Belt", "Rocky Mountain"].sample
            end
            state.update_attribute(:region, state_region) 
        end
        
    end

    def generate_after_creation
        assign_district_counts
        assign_districts
        assign_district_numbers
        calculate_state_pvi
        calculate_state_population
        calculate_state_density
        generate_state_region
    end

    def generate_district_industry
        districts.each do |district|
            district.generate_industry_1
        end
    end
    
    
end
