require 'rails_helper'

describe Adoption, type: :model do 
    describe 'relationships' do
        it { should have_many :adoption_pets}
    end
end
