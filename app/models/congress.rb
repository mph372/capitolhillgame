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
        @loose_pcc = @number_of_districts / @number_of_states
        $i = 1
        while $i < @number_of_states do
            @ten_pcc = @loose_pcc * 0.5
            @rand_num = rand( (@loose_pcc - @ten_pcc)..(@loose_pcc + @ten_pcc) )
            $i += 1
           @numbers << @rand_num.round
       end

       @numbers_total = @numbers.inject(:+)
       @numbers << (@number_of_districts - @numbers_total).round

        states.each do |state|
           @array_number = rand(@numbers.length)
           @district_count = @numbers[@array_number]
           state.update_attribute(:number_of_districts, @district_count)
           @numbers.delete_at(@district_count)
        end
    end

    def assign_districts
        @states = states
        @districts = districts
        
        @states.each do |state|
            $i = 1
            while $i < state.number_of_districts do
                @districts_to_be_edited = @districts.where("state_id IS NULL").limit(state.number_of_districts)
                    @districts_to_be_edited.each do |district|
                        district.update_attribute(:state, state)
                    $i += 1    
                    end 
            end
        end
        
    end

end
