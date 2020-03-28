require 'rails_helper'

describe Favorite do 
    describe "#total_count" do 
        it "can calculate the total number of items it holds" do 
            favorite = Favorite.new({
                1 => 2,
                2 => 3
            })
            expect(cart.total_count).to eq(5)
        end
    end
end