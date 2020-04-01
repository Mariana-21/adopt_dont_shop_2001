require 'rails_helper' 

describe AdoptionPet, type: :model do 
    describe 'relationships' do 
        it {should belong_to :adoption}
        it {should belong_to :pet}
    end 
end
