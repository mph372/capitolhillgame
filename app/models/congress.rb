class Congress < ApplicationRecord
    belongs_to :owner, class_name: "User"
    has_many :memberships
    has_many :members, through: :memberships, source: :user
    has_many :states
    has_many :districts
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
        @numbers.push(1,@number_of_districts)
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
    
end
