class State < ApplicationRecord
  belongs_to :congress

  def generate_name
      @states_list = ["California", "Washington", "Oregon"]
      @shared_states = congress.states
      loop do
        @state_name = @states_list.sample
        break if @shared_states.any?{|s| s.name == @state_name} == false
      end    
      update_attribute(:name, @state_name)
    end
end
